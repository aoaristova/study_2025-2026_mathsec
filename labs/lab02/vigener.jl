function vigener_encrypt(msg, key)
    alph = 'a':'z'
    result = ""
    key_index = 1

    for i in msg
        if isletter(i)
            shift = findfirst(isequal(key[key_index]),  alph) - 1
            index = findfirst(isequal(i), alph) + shift
            if index > 26
                index = index - 26
            end
            result = result * alph[index]
            key_index = key_index + 1
            if key_index > length(key)
                key_index = 1
            end 
        #= else 
            result = result * i
        =#
        end 
    end 
    result
end 

msg = "hello world"
key = "abcde"
println(vigener_encrypt(msg, key))

        