// Библиотека стилей для конспекта по теории кодирования

// --- Счетчики ---
#let thm-cnt = counter("theorem")
#let lem-cnt = counter("lemma")
#let def-cnt = counter("definition")
#let ex-cnt = counter("example")
#let alg-cnt = counter("algorithm")
#let prop-cnt = counter("proposition")

// --- Оформленные блоки ---
#let _box(body, color) = block(
  width: 100%,
  inset: (x: 12pt, y: 8pt),
  radius: 3pt,
  stroke: (left: 2pt + color),
  fill: color.lighten(94%),
  breakable: true,
  body,
)

#let _head(label, cnt, name, color) = {
  let prefix = text(fill: color)[*#label #context cnt.get().first()*]
  let tail = if name != none {
    text(fill: color)[ (#name). ]
  } else {
    [. ]
  }
  prefix + tail
}

#let thm(body, name: none) = {
  thm-cnt.step()
  _box(_head("Теорема", thm-cnt, name, rgb("#1a4d80")) + body, rgb("#1a4d80"))
}

#let lem(body, name: none) = {
  lem-cnt.step()
  _box(_head("Лемма", lem-cnt, name, rgb("#1a4d80")) + body, rgb("#1a4d80"))
}

#let prop(body, name: none) = {
  prop-cnt.step()
  _box(_head("Утверждение", prop-cnt, name, rgb("#1a4d80")) + body, rgb("#1a4d80"))
}

#let defn(body, name: none) = {
  def-cnt.step()
  _box(_head("Определение", def-cnt, name, rgb("#833810")) + body, rgb("#833810"))
}

#let ex(body, name: none) = {
  ex-cnt.step()
  _box(_head("Пример", ex-cnt, name, rgb("#2d6a2d")) + body, rgb("#2d6a2d"))
}

#let alg(body, name: none) = {
  alg-cnt.step()
  _box(_head("Алгоритм", alg-cnt, name, rgb("#5b2d80")) + body, rgb("#5b2d80"))
}

#let rem(body) = _box(text(fill: rgb("#555555"))[*Замечание.* ] + body, rgb("#888888"))

#let proof(body) = block(
  width: 100%,
  inset: (x: 12pt, y: 6pt),
  breakable: true,
)[
  #text(fill: rgb("#555555"))[*Доказательство.* ] #body #h(1fr) $square$
]

#let consp(body) = _box([*Итог.* #body], rgb("#c98a00"))

// --- Математические операторы ---
#let argmin = math.op("arg min", limits: true)
#let argmax = math.op("arg max", limits: true)
#let rank = math.op("rank")
#let wt = math.op("wt")
#let GF = math.op("GF")
#let erfc = math.op("erfc")
#let ord = math.op("ord")
#let Tr = math.op("Tr")
#let ev = math.op("ev")
#let supp = math.op("supp")
#let Loc = math.op("Loc")
#let Span = math.op("Span")
#let RM = math.op("RM")

// --- Настройки документа ---
#let doc-init(body) = {
  set page(
    paper: "a4",
    margin: (top: 2.2cm, bottom: 2.2cm, left: 2.2cm, right: 2.2cm),
    numbering: "1",
    footer: context align(center)[
      #text(size: 9pt, fill: gray)[#counter(page).display("1") -- Теория кодирования. Конспект]
    ],
  )
  set text(font: "Libertinus Serif", size: 10.5pt, lang: "ru")
  set heading(numbering: "1.1")
  set par(justify: true, leading: 0.68em)
  set enum(indent: 1em)
  set list(indent: 1em, tight: false)

  // Титульный лист
  align(center)[
    #v(6cm)
    #text(size: 20pt)[*Теория кодирования*]
    #v(0.5cm)
    #text(size: 14pt)[Конспект курса]
    #v(0.5cm)
    #text(size: 11pt, fill: gray)[По материалам лекций]
  ]
  pagebreak()

  outline(title: [Содержание], depth: 2)
  pagebreak()

  body
}
