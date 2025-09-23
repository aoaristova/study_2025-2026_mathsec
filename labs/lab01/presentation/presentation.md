---
## Front matter
lang: ru-RU
title: Презентация к лабораторной работе 1
subtitle: Математические основы защиты информации и информационной безопасности
author:
  - Аристова Арина Олеговна
institute:
  - Российский университет дружбы народов, Москва, Россия
date: 23 сентября 2025

## i18n babel
babel-lang: russian
babel-otherlangs: english

## Formatting pdf
toc: false
toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
---

## Докладчик

:::::::::::::: {.columns align=center}
::: {.column width="70%"}

  * Аристова Арина Олеговна
  * студентка группы НФИмд-01-25
  * Российский университет дружбы народов
  * [1032259382@rudn.ru](mailto: 1032259382@rudn.ru)
  * <https://github.com/aoaristova>

:::
::: {.column width="30%"}

![](./image/я.jpg)

:::
::::::::::::::


## Цель работы

Изучить шифрование простой заменой, в частности шифры Цезаря и Атбаш.

## Задание

- Реализовать шифр Цезаря с произвольным ключом k

- Реализовать шифр Атбаш

# Выполнение лабораторной работы

## Код шифрования шифром Цезаря 

Программа принимает сообщение, которое необходимо закодировать, ключевое слово и размер сдвига.

Код создает алфавит, в котором сначала ключевое слово, затем остальные символы алфавита в алфавитном порядке, и осуществляет необходимый сдвиг:

## Код шифрования шифром Цезаря 

```p
msg = ARGS[1]
key_word = ARGS[2]
key_num = parse(Int, ARGS[3])
```
## Код шифрования шифром Цезаря 

```p
function encrypt()
    result = ""
    alph = ""
    for c in key_word
    	if !(c in alph)
	    alph = alph * c
	end 
    end
```

## Код шифрования шифром Цезаря 

```p    	
    first_char = msg[1]
    if first_char in "абвгдеёжзийклмнопрстуфхцчшщьыъэюя"
	for i in "абвгдеёжзийклмнопрстуфхцчшщьыъэюя"
	    if !(i in alph)
		alph = alph * i
	    end
	end
    else 
	for i in "abcdefghijklmnopqrstuvwxyz"
	    if !(i in alph)
		alph = alph * i
	    end
	end
    end
    println(alph)
```

## Код шифрования шифром Цезаря 

```p  
    alph_vec = collect(alph)   # преобразуем строку в массив символов для русского 
    for char in msg
	ind = findfirst(char, alph)
	result = result * alph_vec[(ind + key_num - 1) % length(alph_vec) + 1]
    end 
    result
end 
a = encrypt()
println(a)	
```

## Проверка работы кода

Проверяю работу кода, получаю результат, идентичный тому, что был получен мною в результате шифрования вручную:

![Проверка работы шифрования шифром Цезаря](image/1.png){#fig:001 width=90%}

## Реализация шифра Атбаш

Данная программа принимает на вход сообщение для шифрования и алфавит, переворачивает алфавит и задает результат шифрования теми же индексами 

## Код шифрования шифром Атбаш 

```p
msg = ARGS[1]
alph = ARGS[2]
rev = reverse(alph)
function atbash()
    result = ""
    for c in msg
        result = result * rev[findfirst(c, alph)]
    end 
    result
end
a = atbash()
println(a)

```

## Проверка работы кода 

Проверяю работу кода, получаю результат, идентичный тому, что был получен мною в результате шифрования вручную:

![Проверка работы шифрования шифром Атбаш](image/2.png){#fig:002 width=90%}

## Вывод 

В ходе выполнения данной лабораторной работы мною были получены знания о шифрах простой замены, а также навыки по реализации шифрования простой заменой, а именно шифрами Цезаря и Атбаш.

