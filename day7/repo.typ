#import "../template.typ": *
#import "../bxbibwrite.typ": *
#import "@preview/tenv:0.1.2": parse_dotenv
#show: use-bib-item-ref

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第7回",
  subtitle: "",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：" + env.STUDENT_AFFILIATION),
  ),
  date: "2025 年 12 月 1 日",
)

== 1

=== (1)

4 回

=== (2)

${ 1, 3, 7, 4, 6, 5 }$

== 2

=== (1)

10 回

=== (2)

${ 1, 4, 6, 7, 3, 5 }$

== 3

=== (1)

交換回数は、 4 回

最終的に得られるヒープは以下の図の通り。

#image("images/q3-1.png", width: 60%)

=== (2)

交換回数は、 7 回

5を削除する直前のヒープは以下の図の通り。

#image("images/q3-2.png", width: 60%)
