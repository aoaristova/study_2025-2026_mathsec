# Базовый алгоритм
function evclid(a::Int, b::Int)
    while b != 0
        a, b = b, a % b
    end
    return abs(a)
end 

# Бинарный алгоритм
function bin_evclid(a::Int, b::Int)
    if a == 0 
        return abs(b) 
    end
    if b == 0 
        return abs(a)
    end
    shift = 0
    while iseven(a) && iseven(b)
        a >>= 1 
        b >>= 1
        shift += 1
    end
    while a != b
        if iseven(a)
            a >>= 1
        elseif iseven(b)
            b >>= 1
        elseif a > b
            a = a - b
        else
            b = b - a
        end 
    end
    return a << shift 
end 

# Расширенный алгоритм

function extended_evclid(a::Int, b::Int)
    old_r, r = a, b
    old_x, x = 1, 0
    old_y, y = 0, 1
    while r != 0
        quotient = div(old_r, r)
        old_r, r = r, old_r - quotient*r
        old_x, x = x, old_x - quotient*x
        old_y, y = y, old_y - quotient*y
    end 
    return old_r, old_x, old_y
end


# Расширенный бинарный алгоритм Евклида
function extended_bin_evclid(a::Int, b::Int)
    if a == 0 
        return b, 0, 1 
    end
    if b == 0 
        return a, 1, 0 
    end
    g = 1
    while iseven(a) && iseven(b)
        a >>= 1
        b >>= 1
        g <<= 1
    end
    u, v = a, b
    A, B, C, D = 1, 0, 0, 1
    while u != 0
        while iseven(u)
            u >>= 1
            if iseven(A) && iseven(B)
                A >>= 1
                B >>= 1
            else
                A = (A + b) >> 1
                B = (B - a) >> 1
            end
        end
        while iseven(v)
            v >>= 1
            if iseven(C) && iseven(D)
                C >>= 1
                D >>= 1
            else
                C = (C + b) >> 1
                D = (D - a) >> 1
            end
        end
        if u >= v
            u -= v
            A -= C
            B -= D
        else
            v -= u
            C -= A
            D -= B
        end
    end
    return g * v, C, D
end


println(evclid(12, 20))
println(bin_evclid(12, 20))
println(extended_evclid(12, 20))
println(extended_bin_evclid(12, 20))