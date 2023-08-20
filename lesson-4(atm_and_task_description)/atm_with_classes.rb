class CashMachine
    def initialize
      @balance = File.exist?('C:\Users\Denis\krd-practice\lesson-4(atm_and_task_description)\balance.txt') ? File.read('C:\Users\Denis\krd-practice\lesson-4(atm_and_task_description)balance.txt').to_f : 100.0
    end
  
    def start
      loop do
        print 'Введите D, чтобы внести деньги, W, чтобы вывести деньги, B, чтобы проверить баланс, или Q, чтобы выйти: '
        action = gets.chomp.downcase
  
        case action
        when 'd'
          deposit
        when 'w'
          withdrawal
        when 'b'
          check_balance
        when 'q'
          exit_program
        else
          puts 'Неправильный ввод. Пожалуйста, попробуйте еще раз'
        end
      end
    end
  
    private
  
    def deposit
      print 'Введите сумму депозита: '
      amount = gets.chomp.to_f
  
      if amount > 0
        @balance += amount
        puts "Ваш новый баланс: #{@balance}"
      else
        puts 'Сумма депозита должна быть больше нуля'
      end
    end
  
    def withdrawal
      print 'Введите сумму вывода: '
      amount = gets.chomp.to_f
  
      if amount > 0 && amount <= @balance
        @balance -= amount
        puts "Ваш новый баланс: #{@balance}"
      else
        puts 'Сумма вывода должна быть больше нуля и меньше или равна текущему балансу'
      end
    end
  
    def check_balance
      puts "Ваш текущий баланс: #{@balance}"
    end
  
    def exit_program
      File.write('C:\Users\Denis\krd-practice\lesson-4(atm_and_task_description)balance.txt', @balance)
      puts 'Спасибо за использование нашей программы!'
      exit
    end
  end
  
  CashMachine.new.start
  