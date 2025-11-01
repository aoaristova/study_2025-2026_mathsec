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
