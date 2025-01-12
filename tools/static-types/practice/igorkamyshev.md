В TypeScript существует «строгий режим» — он вынуждает указывать типы в тех случаях, когда язык не может определить их сам.

Если проект только стартует, и TypeScript был сразу выбран как основной язык, лучше включить строгий режим сразу.

```js
{
  // ...
  "compilerOptions": {
    // ...
    // Запрещает класть в переменную null без явного объявления
    "strictNullChecks": true,
    // Делает вызовы методов bind, call, apply строго типизированными
    "strictBindCallApply": true,
    // Делает более строгими типы функция
    "strictFunctionTypes": true,
    // Запрешает объявления не пустого поля класса без инициализации
    "strictPropertyInitialization": true,
    // ...
  },
  // ...
}
```

Если проект был написан на JavaScript, и TypeScript внедряется туда постепенно, строгий режим может сильно замедлить этот процесс.
