function rails_encrypt(msg, key, k)
        grid = fill(" ", 2 * k, 2 * k)
        matrix = fill(" ", k, k)
        index = 1
        result = ""
        msg = replace(msg, " " => "")
        for i in 1:k
                for j in 1:k
                        grid[i, j] = string(index)
                        matrix[i, j] = string(index)
                        index += 1
                end
        end
        for i = 1:(size(grid)[1])
                for j = (size(grid)[1]):-1:1
                        if grid[i, j] == " "
                                matrix = rotr90(matrix)
                                grid[(i+k-1):-1:i, j:-1:(j-k+1)] = matrix[k:-1:1, k:-1:1]
                        end
                end
        end

        index = 1
        arr = Vector{String}()

        for r in msg
                checker = false
                for i = 1:(size(grid)[1])
                        for j = 1:(size(grid)[2])
                                if grid[i, j] == string(index) && checker == false
                                        if ((string(i + 1, " ", j) ∉ arr) && (string(i - 1, " ", j) ∉ arr) && (string(i, " ", j - 1) ∉ arr) && (string(i, " ", j + 1) ∉ arr))
                                                grid[i, j] = string(r)
                                                push!(arr, string(i, " ", j))
                                                checker = true
                                        end
                                end
                        end
                        if checker == true
                                index = index + 1
                                if index > k^2
                                        index = 1
                                        empty!(arr)
                                end
                                break
                        end
                end
        end

        for j in sort(collect(key))
                for i = 1:2k
                        result = result * (grid[i, (findfirst(j, key))])
                        if tryparse(Float64, string(last(result))) != nothing
                                result = replace(result, last(result) => ' ')
                        end
                end
        end
        return result

end

msg = "hello world"
key = "keys"
k = 2
res = replace(rails_encrypt(msg, key, k), " " => "")
println(res)
