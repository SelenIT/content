#!/bin/bash
options=("CSS" "HTML" "JavaScript" "Инструменты")
tags=("Дока" "Статья")

CATEGORY=""
TYPE=""
AUTHOR=""

read -r -p "$(echo "Введите название статьи: ")" TITLE
read -r -p "$(echo "Введите название папки (используется для формирования ссылки): ")" FOLDER


function jsonValue() {
KEY=$1
num=$2
awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print $(i+1)}}}' | tr -d '"' | sed -n ${num}p
}
LOGIN=$(echo $(curl -s https://api.github.com/search/users\?q\=$(echo $(git config --get user.email)) | jsonValue login))

read -r -p "$(echo "Введите ник на GitHub (по умолчанию будет использован $LOGIN): ")" AUTHOR

if [[ $AUTHOR == "" ]]; then
  AUTHOR=$LOGIN
fi

echo -e "\nДоступные разделы для публикации в Доке:"

PS3='Выберете раздел: '

select opt in "${options[@]}"
do
  case $opt in
    "CSS")
      CATEGORY=css
      break
      ;;
    "HTML")
      CATEGORY=html
      break
      ;;
    "JavaScript")
      CATEGORY=js
      break
      ;;
    "Инструменты")
      CATEGORY=tools
      break
      ;;
    *) echo "Такого раздела ещё нет... Введите корректный номер";;
  esac
done

echo -e "\nДоступные типы публикации в Доке:\nСтатья — расширенный материал, посвящённый определённому вопросу, с авторским мнением, примерами и рассуждениями\nДока — справочный материал, кратко и формально описывающий какое-то понятие"

PS3='Выберете тип материала: '

select tag in "${tags[@]}"
do
  case $tag in
    "Статья")
      TYPE=article
      break
      ;;
    "Дока")
      TYPE=doka
      break
      ;;
    *) echo "Такого типа ещё нет... Введите корректный номер";;
  esac
done

read -r -p "$(echo "Создавать новую ветку git? (y/n) ")" RESPONSE

case $RESPONSE in
  [yY][eE][sS]|[yY])

    git checkout main
    git pull

    git branch $(echo "article/$FOLDER")
    git checkout $(echo "article/$FOLDER")

    ;;
*)
esac


mkdir $(echo "$CATEGORY/$FOLDER")
touch $(echo "$CATEGORY/$FOLDER/index.md")
cat <<EOF > $(echo "$CATEGORY/$FOLDER/index.md")
---
title: "$TITLE"
authors:
  - $AUTHOR
tags:
  - $TYPE
---

## Кратко

## Как начать

## Как понять

EOF

echo "Новый материал создан и находится в папке: $CATEGORY/$FOLDER"
cat $(echo "$CATEGORY/$FOLDER/index.md")
