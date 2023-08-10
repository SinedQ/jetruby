balance = File.exist?('C:\Users\Denis\krd-practice\lesson-4\balance.txt') ? File.read('C:\Users\Denis\krd-practice\lesson-4\balance.txt').to_f : 100.0
puts "Ваш текущий баланс: #{balance}"

loop do
  print 'Введите D, чтобы внести деньги, W, чтобы вывести деньги, B, чтобы проверить баланс, или Q, чтобы выйти: '
  action = gets.chomp.downcase

  case action
  when 'd'
    print 'Введите сумму депозита: '
    deposit = gets.chomp.to_f

    if deposit > 0
      balance += deposit
      puts "Ваш новый баланс: #{balance}"
    else
      puts 'Сумма депозита должна быть больше нуля'
    end
  when 'w'
    print 'Введите сумму вывода: '
    withdrawal = gets.chomp.to_f

    if withdrawal > 0 && withdrawal <= balance
      balance -= withdrawal
      puts "Ваш новый баланс: #{balance}"
    else
      puts 'Сумма вывода должна быть больше нуля и меньше или равна текущему балансу'
    end
  when 'b'
    puts "Ваш текущий баланс: #{balance}"
  when 'q'
    File.write('C:\Users\Denis\krd-practice\lesson-4\balance.txt', balance)
    puts 'Спасибо за использование нашей программы!'
    exit
  else
    puts 'Неправильный ввод. Пожалуйста, попробуйте еще раз'
  end
end