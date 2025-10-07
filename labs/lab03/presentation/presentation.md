---
## Front matter
lang: ru-RU
title: Презентация к лабораторной работе 3
subtitle: Математические основы защиты информации и информационной безопасности
author:
  - Аристова Арина Олеговна
institute:
  - Российский университет дружбы народов имени Патриса Лумумбы, Москва, Россия
date: 07 октября 2025

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
  * Российский университет дружбы народов имени Патриса Лумумбы
  * [1032259382@rudn.ru](mailto: 1032259382@rudn.ru)
  * <https://github.com/aoaristova>

:::
::: {.column width="30%"}

![](./image/я.jpg)

:::
::::::::::::::


## Цель работы

Изучить шифрование гамиированием, реализовать соответствующий алгоритм на языке Julia.


## Задание

- Реализовать шифр гаммированием

# Выполнение лабораторной работы

## Реализация шифрования гаммированием

В коде задан русский алфавит. Необходимые переменные содержат текст, который необходимо зашифровать и гамма-ключ.

```
alphabet = ['А', 'Б', 'В', 'Г', 'Д', 'Е', 'Ж', 'З', 'И', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П', 'Р', 'С', 'Т', 'У', 'Ф', 'Х', 'Ц', 'Ч', 'Ш', 'Щ', 'Ъ', 'Ы', 'Ь', 'Э', 'Ю', 'Я']

text = "ПРИКАЗ"
gamma = "ГАММА"

```
## Реализация шифрования гаммированием

Две функции реализуют переходы от текста к номерам в алфавите и наоборот.

```
function text_to_numbers(text)
    [findfirst(==(c), alphabet) for c in collect(text)]
end

function numbers_to_text(numbers)
    join([alphabet[n] for n in numbers])
end 
```

## Реализация шифрования гаммированием

Сперва необходимо перевести тексты в массивы номеров символов, а также зациклить гамма-ключ так, чтобы символов хватило для шифрования строки длиной *length(text)*.

Затем реализуем шифрование текста нахождением остатка от деления на **33** суммы индексов каждого из символов текста и гамма-ключа.

```  	
gamma_extended = join(first(collect(repeat(gamma, ceil(Int,length(text)/length(gamma)))), length(text)))

text_numbers = text_to_numbers(text)
gamma_numbers = text_to_numbers(gamma_extended)
```

## Реализация шифрования гаммированием

Для расшифровки текста находим остатки от деления на **33** разности числового значения символа в шифре и соответствующего значения гамма-ключа.

Затем переводим массивы числовых значений в текст и выводим результаты.

```
encrypted_numbers = [mod(t+g-1, 33) + 1 for (t, g) in zip(text_numbers, gamma_numbers)]
decrypted_numbers = [mod(e - g - 1, 33) + 1 for (e, g) in zip(encrypted_numbers, gamma_numbers)]

encrypted_text = numbers_to_text(encrypted_numbers)
decrypted_text = numbers_to_text(decrypted_numbers)

println("Исходный текст:", text)
println("Зашифрованный текст:", encrypted_text)
println("Расшифрованный текст:", decrypted_text)
```

## Проверка работы кода

Проверяю работу кода, получаю результат, идентичный тому, что был получен в приведенном тексте лабораторной работы

![Результат работы программы](image/1.png){#fig:001 width=90%}

## Вывод 

В ходе выполнения данной лабораторной работы мною были получены знания о шифровании гаммированием, а также создана программа для реализации шифрования и рвасшифрования с помощью гаммирования.
