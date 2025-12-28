#import "../template.typ": *
#import "../bxbibwrite.typ": *
#import "@preview/tenv:0.1.2": parse_dotenv
#import "@preview/codelst:2.0.2": sourcecode
#show: use-bib-item-ref

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第11回",
  subtitle: "",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：" + env.STUDENT_AFFILIATION),
  ),
  date: "2025 年 12 月 28 日",
)

== 1

=== (1)

$
mat(
  0, 0, 1, 1, 0;
  0, 0, 0, 1, 1;
  0, 1, 0, 0, 1;
  0, 0, 1, 0, 0;
  0, 0, 1, 1, 0;
)
$

=== (2)

==== 縦型探索
#image("images/q1-2-1.png")

==== 横型探索
#image("images/q1-2-2.png")

== 2

=== (1)

#sourcecode[```c
int w[N][N] = {
  { M,   M,  20, 100,   M },
  { M,   M,   M,  50,  10 },
  { M,  20,   M,   M, 100 },
  { M,   M,  80,   M,   M },
  { M,   M,  50,  10,   M }
};
```]

=== (2)

==== S
$S = { T, F, F, F, F }$
#footnote[Cライクな擬似コードでの表現のためこう表したが、集合的に表すなら、$S = { 0 }$となるだろう。]

==== d[N]

${ M, M, 20, 100, M }$

=== (3)

+ 0回目
  + $u = 2$
  + $S = {T, F, T, F, F}$
  + $d = { M, 40, 20, 100, 120 }$
+ 1回目
  + $u = 1$
  + $S = {T, T, T, F, F}$
  + $d = { M, 40, 20, 90, 50 }$
+ 2回目
  + $u = 4$
  + $S = {T, T, T, F, T}$
  + $d = { M, 40, 20, 60, 50 }$
+ 3回目
  + $u = 3$
  + $S = {T, T, T, T, T}$
  + $d = { M, 40, 20, 60, 50 }$
