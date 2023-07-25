def greeting
    print 'Введите ваше имя: '
    name = gets.chomp()
    print 'Введите вашу фамилию: '
    surname = gets.chomp()
    print 'Введите ваш возраст: '
    age = gets.chomp().to_i
    if age < 18
        puts "Привет, #{name} #{surname}, тебе меньше 18 лет, но начать учиться программировать никогда не рано"
    else
        puts "Привет, #{name} #{surname}, cамое время заняться делом!"
    end
end
greeting
