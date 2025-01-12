---
title: "<progress>"
authors:
  - doka-dog
keywords:
  - прогресс-бар
tags:
  - doka
  - placeholder
---

## Кратко

Тег `<progress>` создаёт индикатор выполнения задачи. Обычно выглядит как прогресс-бар.

## Как пишется

```html
<progress value="30" max="100"></progress>
```

Для тега указывается максимальное значение при помощи атрибута `max`. Значение должно быть положительным, допускаются дробные значения. По умолчанию равно `1`.

Текущее значение указывается при помощи атрибута `value`. Должно находится в промежутке между 0 и значением атрибута `max`. Если атрибут не прописан, то линия внутри прогресс-бара будет перетекать от края к краю, показывая, что задача выполняется, но не известно, сколько это займёт времени.

## Как понять

Тег `<progress>` стоит использоваться для вывода информации о процессе, который должен завершиться: прогресс загрузки, длительность таймера. Для вывода количества места на диске или уровня громкости лучше подойдёт `<meter>`.
