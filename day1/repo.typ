#import "../template.typ": *
#import "../bxbibwrite.typ": *
#import "@preview/tenv:0.1.1": parse_dotenv
#import "@preview/codelst:2.0.2": sourcecode
#import "@preview/showybox:2.0.4": showybox
#show: use-bib-item-ref

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "クイズ1",
  subtitle: "",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：" + env.STUDENT_AFFILIATION),
  ),
  date: "2025 年 10 月 12 日",
)

== 問題1

考えるのは面倒なので、擬似コードと等価なCコードを書き、実行した。
以下コードを実行して解くことがあるが、そのCコードの全容は https://github.com/reversed-R/UTsukuba-data-structure-and-algorithm にてこのレポートデータとともに公開されている。

以下を実行した結果解が得られた。

#sourcecode[```c
#include "../../assets/ceil.h"
#include "../../assets/types.h"
#include "stdio.h"
#include "stdlib.h"

int binary_search(int A[], int d, int n) {
  int l = 0;
  int h = n - 1;
  while (l < h) {
    int m = CEIL_DIV(l + h, 2);
    if (A[m] == d) {
      return TRUE;
    }
    if (d < A[m]) {
      h = m - 1;
    } else {
      l = m + 1;
    }
  }
  printf("A[l]: %d\n", A[l]);
  if (A[l] == d) {
    return TRUE;
  }
  return FALSE;
}

int main(int argc, char *argv[]) {
  int A[] = {7, 10, 14, 33, 38, 39, 46, 47, 54, 59, 67, 75, 78, 84, 97};

  printf("search 40\n");
  binary_search(A, 40, sizeof A / sizeof(int));

  printf("search 90\n");
  binary_search(A, 90, sizeof A / sizeof(int));

  return EXIT_SUCCESS;
}
```]


=== 1. 40 を探索する場合
  46
=== 2. 90 を探索する場合
  97


== 問題2

#sourcecode[```c
#include "../../assets/types.h"
#include "stdio.h"
#include "stdlib.h"

int fib_recursive(int n) {
  if (n == 0) {
    printf("return 0\n");
    return 0;
  }
  if (n == 1) {
    printf("return 1\n");
    return 1;
  }

  printf("return fib_recursive(%d) + fib_recursive(%d);\n", n - 1, n - 2);
  return fib_recursive(n - 1) + fib_recursive(n - 2);
}

int main(int argc, char *argv[]) {
  printf("==== fib_recursive(3) ====\n");
  fib_recursive(3);

  printf("==== fib_recursive(6) ====\n");
  fib_recursive(6);

  return EXIT_SUCCESS;
}
```]

上のコードを実行すると以下の出力が得られる。

#sourcecode[```sh
$ ./fib.out
==== fib_recursive(3) ====
return fib_recursive(2) + fib_recursive(1);
return fib_recursive(1) + fib_recursive(0);
return 1
return 0
return 1
==== fib_recursive(6) ====
return fib_recursive(5) + fib_recursive(4);
return fib_recursive(4) + fib_recursive(3);
return fib_recursive(3) + fib_recursive(2);
return fib_recursive(2) + fib_recursive(1);
return fib_recursive(1) + fib_recursive(0);
return 1
return 0
return 1
return fib_recursive(1) + fib_recursive(0);
return 1
return 0
return fib_recursive(2) + fib_recursive(1);
return fib_recursive(1) + fib_recursive(0);
return 1
return 0
return 1
return fib_recursive(3) + fib_recursive(2);
return fib_recursive(2) + fib_recursive(1);
return fib_recursive(1) + fib_recursive(0);
return 1
return 0
return 1
return fib_recursive(1) + fib_recursive(0);
return 1
return 0
```
]

実行結果より、

=== 1. `f(3)`

  5 回

=== 2. `f(6)`

  25 回
 
== 問題3

元の問題文は、


#showybox(
  [
    以下の計算量のオーダーを選択肢ア〜オの中から選びなさい．
    
    1. $f(x) = n + 10000$
    2. $f(x) = n^2 + 10n + 100$
    3. $f(x) = n + n^2 + n!$
    4. $f(x) = n root(3, n)$
    
    選択肢 ア：$O(n)$ イ：$O(n^2)$ ウ：$O(n!)$ エ：$O(n log n)$ オ：$O(n^(4/3))$
  ]
)

でありこれは問として明らかにおかしい。
少なくとも1. 2. 4.は$O(1)$になると考えられるがそのような選択肢がない。

「$O(n + n^2 + n!)$という計算オーダーがあるがこれはオーダー記法として適切でないため簡単なものに直せ」という旨の問だと解釈するのならば、
1. ア
2. イ
3. ウ
4. オ
と言うことは出来る。

問の表現として不適切だと考えられるため、修正を求める。

== 問題4

#sourcecode[```c
#include <stdio.h>
#include <stdlib.h>

void swap(int *x, int *y) {
  int *tmp = x;
  x = y;
  y = tmp;
}

int euclid(int n, int m) {
  if (n < m) {
    swap(&n, &m);
  }

  while (m != 0) {
    int r = n % m;
    printf("%d\n", r);
    n = m;
    m = r;
  }

  return n;
}

int main(int argc, char *argv[]) {
  printf("euclid(12345, 678)\n");
  euclid(12345, 678);

  printf("euclid(2025, 1006)\n");
  euclid(2025, 1006);

  return EXIT_SUCCESS;
}
```]

上のコードを実行すると以下の出力が得られる。

#sourcecode[```sh
$ ./euclid.out
euclid(12345, 678)
141
114
27
6
3
0
euclid(2025, 1006)
13
5
3
2
1
0
```]


実行結果より、

=== 1.
#sourcecode[```sh
141
114
27
6
3
0
```]

=== 2.
#sourcecode[```sh
13
5
3
2
1
0
```]


// #bibliography-list(
//   title: "参考文献", // 節見出しの文言
// )[
// #bib-item(<reference>)[参考文献の名前, https://reference.info.com/reference.html, yyyy 年 mm 月 dd 日閲覧]
// ]
