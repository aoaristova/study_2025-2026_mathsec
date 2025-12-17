---
## Front matter
title: "Отчёт по лабораторной работе 8"
subtitle: "Разложение чисел на множители. Алгоритм Полларда"
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

Изучить алгоритм Полларда для разложения составного числа на множители, реализовать его на языке Julia.

# Задание

- Реализовать программно алгоритм Полларда

- Найти наименьший делитель числа с помощью реализованного алгоритма или сделать вывод об отсутствии нетривиальных делителей

# Выполнение лабораторной работы

## Код реализации алгоритмов

Код, реализующий алгоритм Поллардавыглядит следующим образом. 

Функция main() "вытаскивает" из запроса командной строки число, которое будем проверять, поданное в качестве аргумента, в противном случае (если на вход не подано число) проверяем какое-то число по умолчанию.

```
function pollard_rho(n, c=1, f=x -> (x^2 + 5) % n, max_iterations=10000)
    if n % 2 == 0
        return 2
    end 

    a = c
    b = c
    for i in 1:max_iterations
        a = f(a)
        b = f(f(b))

        d = gcd(abs(a-b), n)
        # println("Итерация $i: a = $a, b = $b, d = $d")

        if 1 < d < n
            println("Найден нетривиальный делитель: $d")
            return d
        elseif d == n
            println("Делитель не найден.")
            return nothing
        end
    end 
    println("Достигнуто максимальное кол-во итераций")
    return nothing
end 


function main()
    if length(ARGS) > 0
        n = parse(Int, ARGS[1])
    else 
        n = 1234537
    end
    println("Факторизация числа $n методом  Полларда")
    println("Используется функция f(x) = x**2 + 5 mod n")
    result = pollard_rho(n)
    if result !== nothing
        println("Результат: $n = $result × $(n ÷ result)")
        println("Проверка: $result × $(n ÷ result) = $(result * (n ÷ result))")
    else
        println("Делитель не найден для числа $n")
    end
end


main()

```

## Проверка работы кода

Проверяю работу кода. Рассматриваем разные числа: простое число, не имеющее делителей, и составное число

![Проверка работы кода для простого и составного чисел.](image/1.png){#fig:001 width=90%}


## Вывод

В ходе выполнения лабораторной работы мною было реализовано  программное решение алгоритма поиска нетривиального делителя составного числа методом Полларда.

# Список литературы{.unnumbered}

- Описание лабораторной работы 
