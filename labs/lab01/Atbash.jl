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