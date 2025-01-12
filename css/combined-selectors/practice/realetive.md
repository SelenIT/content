🛠 Лучше записывать селекторы по одному на строчку — так их легче читать и редактировать:

```css
.selector1,
code,
#id,
[attr="value"] {
  color: red;
}
```

🛠 Объединение увеличивает специфичность правила, поэтому это может быть удобно для переопределения свойств без `!important`:

Код ниже нельзя редактировать по каким-то причинам:

```css
.class1 {
  color: red;
}
```

Увеличим специфичность, чтобы переопределить правило, описанное в нередактируемой части и потому имеющее больший вес:

```css
.class1.class2 {
  color: green;
}

.class1 {
  color: red;
}
```

В итоге текст в блоке, имеющем сразу и класс `.class1` и класс `.class2`, будет зелёного цвета.

🛠 Получается, что даже невинный пробел уже имеет значение при выборе селектора на любом уровне вложенности.

Независимо от уровня вложенности селектор `article h3` «найдёт» `<h3>` с текстом «Очень вложенный заголовок» и любые другие `<h3>`, которые располагаются внутри `<article>`:

```html
<article>
  <div>
    <div>
      <div>
        <div>
          <div>
            <div>
              <div>
                <div>
                  <div>
                    <h3>Очень вложенный заголовок</h3>
                  </div>
                </div>
              </div>
              <h3>Заголовок</h3>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</article>
```

🛠 С помощью смежного комбинатора удобно «выделять» группу одинаковых элементов по принципу «все кроме первого», например, для отступа.

К первому `<li>` стили не применятся, поскольку перед ним нет другого `<li>`:

```html
<ul>
  <li>Первый пункт</li>
  <li>Второй пункт</li>
  <li>Третий пункт</li>
  <li>Четвёртый пункт</li>
</ul>
```

```css
li + li {
  margin-top: 1em;
}
```

Классический пример — вёрстка «звёздного» рейтинга. Для начала опишем структуру:

```html
<div class="rating">
  <button>★</button>
  <button>★</button>
  <button>★</button>
  <button>★</button>
  <button>★</button>
</div>
```

И стили:

```css
button {
  border: none;
  background-color: transparent;
  font-size: 2em;
}

button:hover,
button:focus,
button:hover ~ button,
button:focus ~ button {
  color: red;
}
```

Но сейчас при наведении курсора будут выделяться все элементы _после_ (т. е. справа). Чтобы это исправить, мы изменим порядок следования элементов с помощью CSS-свойства `direction: rtl`:

<p class="codepen" data-height="265" data-theme-id="light" data-default-tab="css,result" data-user="solarrust" data-slug-hash="xxRjBJx" style="height: 265px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;" data-pen-title="rating">
  <span>See the Pen <a href="https://codepen.io/solarrust/pen/xxRjBJx">
  rating</a> by Alena (<a href="https://codepen.io/solarrust">@solarrust</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>
