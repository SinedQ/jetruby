def foobar
    print 'Введите первое число: '
    x = gets.chomp().to_i
    print 'Введите второе число: '
    y = gets.chomp().to_i
    if x == 20
        puts y
    elsif y == 20
        puts x
    else
        puts x + y
    end
end
foobar