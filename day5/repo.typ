#import "../template.typ": *
#import "../bxbibwrite.typ": *
#import "@preview/tenv:0.1.2": parse_dotenv
#show: use-bib-item-ref

#let env = parse_dotenv(read("../.env"))

#show: project.with(
  week: "第5回",
  subtitle: "",
  authors: (
    (name: env.STUDENT_NAME, email: "学籍番号：" + env.STUDENT_ID, affiliation: "所属：" + env.STUDENT_AFFILIATION),
  ),
  date: "2025 年 11 月 13 日",
)

以下NULLというラベルがある図があるが、mermaidで木の節の左右を維持して描画するためのものであり無視して良い。

== 1

=== (1)

#image("images/q1-1.png", width: 60%)

=== (2)

#image("images/q1-2.png", width: 60%)


=== (3)

#image("images/q1-3.png", width: 60%)

== 2

=== (1)

$9, 5, 8$

=== (2)

#image("images/q2-2.png", width: 60%)

=== (3)

#image("images/q2-3.png", width: 60%)

=== (4)

#image("images/q2-4.png", width: 60%)
