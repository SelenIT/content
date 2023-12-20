---
title: "Ленивая загрузка картинок с цветным превью"
description: "Как добавить цветное превью при ленивой загрузке изображения."
authors:
  - prorokky
related:
  - js/intersection-observer
  - html/img
  - css/background-color
tags:
  - article
---

## Задача

_Ленивая загрузка (lazy loadnig)_ — это асинхронная загрузка картинок на веб-странице. Это означает, что картинки загружаются после полной загрузки страницы или когда они появляются в видимой части окна браузера. Следовательно, если пользователь не будет прокручивать экран, то изображения, размещённые за пределами экрана, не будут загружаться.

Иногда хочется, чтобы изображение появлялось не внезапно, а чтобы пользователь заранее знал, что оно там будет благодаря превью.

Ленивую загрузку часто используют на сайтах с большим количеством изображений. Таким образом можно экономить трафик на сайт и повысить производительность.

При большом количестве изображений на сайте можно настроить приоритет их загрузки. Для этого можно использовать атрибут `fetch-priority` в теге [`<img>`](/html/img/). Всего у атрибута есть 3 значения:

1. `high` – высокий приоритет относительно других изображений.
1. `low` – низкий приоритет относительно других изображений.
1. `auto` – приоритет по умолчанию, который указывает на отсутствие предпочтения приоритета выборки. В таком случае браузер сам решает, что лучше для пользователя.

Также стоит помнить о том, что не стоит использовать атрибут `loading` если картинку гарантированно находится в области видимости.

Ленивую загрузку можно реализовать несколькими способами:

1. Атрибут `loading` в теге [`<img>`](/html/img/).
1. [Intersection Observer API](/js/intersection-observer/).
1. Использовать прогрессивные изображения.

_Прогрессивные изображения (progressive images)_ – метод, позволяющий постепенно загружать изображения, начиная с низкого разрешения и улучшая его качество постепенно.

Ниже разберём решение с использованием progressive images.

## Готовое решение

<iframe title="Ленивая загрузка" src="demos/lazy-load/" height="350"></iframe>

## Разбор решения

Используем атрибут [`data-src`](/html/data-attributes/), чтобы хранить ссылку на полное изображение, и атрибут `src`, чтобы установить начальное изображение низкого разрешения, которое будет быстро загружено.

### Разметка

```html
<img
  src="low-resolution.jpg"
  data-src="high-resolution.jpg"
  alt="Лягушка"
  class="lazy-image"
  id="progressive-image"
>
```

### Стили

Стоит добавить картинке размеры. Это позволит при отрисовке страницы оставлять нужное количество пространства ещё до загрузки самого изображения.

Для блюра изображения в низком качестве добавлено свойство [`filter`](/css/filter/).

```css
.lazy-image {
  width: 300px;
  height: 250px;
  background-repeat: no-repeat;
  background-size: cover;
  filter: blur(20px);
}
```

### Скрипт

Код на JavaScript ожидает события [`DOMContentLoaded`](/js/event-domcontentloaded/), чтобы убедиться, что весь [DOM](/js/dom/) уже готов к обработке. Затем создаётся объект `Image` для загрузки изображения низкого разрешения (`lowResImage`). Когда это изображение загружено, мы изменяем атрибут `src` основного изображения (`progressiveImage`) на ссылку на полное изображение, которое будет загружено вместо низкого разрешения и убираем блюр.
```javascript
document.addEventListener('DOMContentLoaded', function() {
  const progressiveImage = document.getElementById('progressive-image')

  const lowResImage = new Image()
  lowResImage.src = progressiveImage.src
  lowResImage.onload = function() {
    progressiveImage.src = progressiveImage.getAttribute('data-src')
    progressiveImage.style.filter = 'none'
  }
})
```