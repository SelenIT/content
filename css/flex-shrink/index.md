---
title: "flex-shrink"
authors:
  - solarrust
editors:
  - tachisis
keywords:
  - сжатие флекс-элементов
  - flexbox
tags:
  - doka
---

## Кратко

Если в контейнере не хватает места для расположения всех элементов без изменения размеров, то свойство `flex-shrink` указывает, в каких пропорциях элемент будет уменьшаться.

Свойство `flex-shrink` полностью противоположно свойству [`flex-grow`](/css/flex-grow/).

## Пример

```css
.container {
  display: flex;
}

.item {
  flex-shrink: 3;
}
```

## Как это понять

Чем больше значение у этого свойства, тем быстрее элемент будет сжиматься по сравнению с соседями, имеющими меньшее значение.

## Как пишется

Значение по умолчанию — 1. Значением может быть любое целое положительное число (включая 0).

## Подсказки

💡 Свойство работает с пропорциональным разделением пространства, не с конкретными размерами элементов. Разобраться во всём поможет статья «[Как реально работает `flex-shrink`](https://medium.com/p/c41e40767194)».

:::callout 📝

Полный список свойств флексбоксов можно посмотреть в [гайде по flexbox](/css/flexbox-guide/).

:::
