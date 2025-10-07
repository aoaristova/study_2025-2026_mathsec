---
## Front matter
title: "Отчёт по лабораторной работе 3"
subtitle: "Шифование гаммированием"
author: "Аристова Арина Олеговна"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---


# Цель работы

Изучить шифрование гамиированием, реализовать соответствующий алгоритм на языке Julia.

# Задание

- Реализовать шифр гаммированием

# Выполнение лабораторной работы

## Код шифрования гаммированием

В коде задан русский алфавит. Необходимые переменные содержат текст, который необходимо зашифровать и гамма-ключ.

Две функции реализуют переходы от текста к номерам в алфавите и наоборот.

Сперва необходимо перевести тексты в массивы номеров символов, а также зациклить гамма-ключ так, чтобы символов хватило для шифрования строки длиной *length(text)*.

Затем реализуем шифрование текста нахождением остатка от деления на **33** суммы индексов каждого из символов текста и гамма-ключа.

Для расшифровки текста находим остатки от деления на **33** разности числового значения символа в шифре и соответствующего значения гамма-ключа.

Затем переводим массивы числовых значений в текст и выводим результаты.

```j
alphabet = ['А', 'Б', 'В', 'Г', 'Д', 'Е', 'Ж', 'З', 'И', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П', 'Р', 'С', 'Т', 'У', 'Ф', 'Х', 'Ц', 'Ч', 'Ш', 'Щ', 'Ъ', 'Ы', 'Ь', 'Э', 'Ю', 'Я']

text = "ПРИКАЗ"
gamma = "ГАММА"

function text_to_numbers(text)
    [findfirst(==(c), alphabet) for c in collect(text)]
end

function numbers_to_text(numbers)
    join([alphabet[n] for n in numbers])
end 

gamma_extended = join(first(collect(repeat(gamma, ceil(Int,length(text)/length(gamma)))), length(text)))

text_numbers = text_to_numbers(text)
gamma_numbers = text_to_numbers(gamma_extended)

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

# Список литературы{.unnumbered}

- Описание лабораторной работы 
