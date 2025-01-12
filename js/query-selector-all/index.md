---
title: "querySelectorAll"
authors:
  - nlopin
keywords:
  - селектор
  - найти элементы по селектору
  - selector
  - найти элементы в html
tags:
  - doka
---

## Кратко

Метод определён для объекта `document` и любого HTML-элемента (`Element`) страницы. Позволяет найти все элементы по CSS-селектору среди дочерних. CSS-селектор передаётся в виде параметра. Этот метод используется в работе очень часто.

Возвращает похожую на массив статическую коллекцию `NodeList` с найденными элементами. Если элементов не нашлось, то коллекция будет пустая, то есть с размером 0.

## Как пишется

Метод принимает один параметр — CSS-селектор в виде строки. Например, можно выбрать все элементы внутри `<div>`

```html
<body>
  <div>
    <p>
      Князь Василий говорил всегда лениво, как актер говорит роль старой
      пиесы. Анна Павловна Шерер, напротив, несмотря на свои сорок лет, была
      преисполнена оживления и порывов.
    </p>
    <p>
      Быть энтузиасткой сделалось её общественным положением, и иногда, когда
      ей даже того не хотелось, она, чтобы не обмануть ожиданий людей, знавших
      её, делалась энтузиасткой. Сдержанная улыбка, игравшая постоянно на лице
      Анны Павловны, хотя и не шла к её отжившим чертам, выражала, как у
      избалованных детей, постоянное сознание своего милого недостатка, от
      которого она не хочет, не может и не находит нужным исправляться.
    </p>
  </div>
  <p>Это параграф, дочерний для body</p>
  <script>
    let paragraphs = document.querySelectorAll("div>p")
    console.log(paragraphs.length) // 2

    // ищем несуществующий элемент
    let spanFromBody = document.querySelectorAll("span")
    console.log(spanFromBody.length) // 0
  </script>
</body>
```

Динамический пример, введи селектор в поле поиска и «Искать»:

<p class="codepen" data-height="558" data-theme-id="light" data-default-tab="result" data-user="Lopinopulos" data-slug-hash="wbqdPe" style="height: 558px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;" data-pen-title="Работа querySelectorAll">
  <span>See the Pen <a href="https://codepen.io/Lopinopulos/pen/wbqdPe">
  Работа querySelectorAll</a> by Nikolai Lopin (<a href="https://codepen.io/Lopinopulos">@Lopinopulos</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://static.codepen.io/assets/embed/ei.js"></script>

## Как понять

Метод работает с DOM, который связан с HTML разметкой. Каждый HTML-элемент имеет родительские и дочерние элементы:

- Родители — это элементы, которые содержат текущий элемент. В примере выше у первого элемента `<p>` есть два родительских элемента — `<div>` и `<body>`.
- Дочерние элементы — это элементы, которые содержит текущий элемент. Они могут быть, а могут не быть. Например, для тега `<body>` все элементы страницы дочерние. У `<p>` дочерний элемент — текст внутри тега.

Если работаешь с корнем страницы, объектом `document`, то поиск идёт по всем элементам страницы (т.е. от `<body>`), если от конкретного элемента, то поиск идёт только по всем дочерним.
