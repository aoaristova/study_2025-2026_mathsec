function route_encrypt(msg, key, rows, cols)
    msg = filter(!isspace, msg)
    matrix = fill('_', rows, cols)
    index = 1
    result = ""
    for i = 1:rows
        for j = 1:cols
            if index != rows*cols
                matrix[i,j] = msg[index]
                index = index + 1
            end
        end
    end
    
    for j in sort(collect(key))
        for i = 1:rows
            result = result * (matrix[i, findfirst(j, key)])
        end 
    end
    result
end 

msg = "hello world hello"
rows = 3
cols = 5
key = "abcde"
println(route_encrypt(msg, key, rows, cols))


