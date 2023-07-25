def ending_in_cs(word)
    if word[-2..-1] == "cs"
        puts "У вас слово заканчивается на CS, поэтому мы выведем на экран цифру 2 в степени количества символов в вашем слове : #{2**word.size}"
    else
        puts "Ваше слово не заканчивается на CS, поэтому мы отзеркалим ваше слово: #{word.reverse}"
    end
end

def word
    puts 'Введите слово: '
    word = gets.chomp.downcase
end

puts ending_in_cs(word)