#import "../template.typ": *
#import "../bxbibwrite.typ": *
#import "@preview/tenv:0.1.2": parse_dotenv
#show: use-bib-item-ref

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第8回",
  subtitle: "",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：" + env.STUDENT_AFFILIATION),
  ),
  date: "2025 年 12 月 7 日",
)

== 1

${3, 1, 4, 2}$

${3, 1}, {4, 2}$

${1, 3}, {2, 4}$

${1, 2, 3, 4}$


== 2

=== (1)

${ 1, 4, 2, 3, 5, 7, 10, 6, 9 }$

=== (2)

#table(
  columns: 2,
  [$p$], [$A[p]$],
  [ 4 ],[ 5 ],
  [ 2 ],[ 3 ],
  [ 1 ],[ 2 ],
  [ 7 ],[ 9 ],
  [ 5 ],[ 6 ],
)

== 3

#table(
  columns: 3,
  [ ], [$525$], [$688$],
  [ 下1桁目 ], [ $5$ ],[ $8$ ],
  [ 下2桁目 ], [ $2$ ],[ $8$ ],
  [ 下3桁目 ], [ $5$ ],[ $6$ ],
)

