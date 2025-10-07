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