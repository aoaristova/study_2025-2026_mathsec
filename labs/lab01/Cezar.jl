# julia Cezar.jl "hello" "elephant" 2
msg = ARGS[1]
key_word = ARGS[2]
key_num = parse(Int, ARGS[3])

function encrypt()
    result = ""
    alph = ""
    for c in key_word
    	if !(c in alph)
	    alph = alph * c
	end 
    end
    	
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
    
    alph_vec = collect(alph)   # преобразуем строку в массив символов для русского 
    for char in msg
	ind = findfirst(char, alph)
	result = result * alph_vec[(ind + key_num - 1) % length(alph_vec) + 1]
    end 
    result
end 
a = encrypt()
println(a)
	