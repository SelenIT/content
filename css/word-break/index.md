---
title: "word-break"
authors:
  - doka-dog
keywords:
  - разрыв строки
  - перенос текста
  - перенос строки
tags:
  - doka
  - placeholder
---

## Кратко

Свойство `word-break` определяет, как будет переноситься на новую строку текст при достижении края родительского контейнера.

## Как пишется

Возможные значения:

- `normal` — значение по умолчанию, устанавливает стандартное поведение при переносе строк.
- `break-all` — при достижении границы родительского блока перенос строки будет вставлен между любыми двумя символами.
- `keep-all` — перевод строки не будет использован в тексте на китайском, японском или корейском языках. Для текста на других языках будет применено `normal`.
- `break-word` (нестандартное) — разобьёт текст в любом месте, в том числе внутри слова, при достижении границы контейнера даже если доступен перенос по словам.
