require 'socket'

class CashMachine
  def initialize
    @balance = File.exist?('C:\Users\Denis\krd-practice\lesson-5\balance.txt') ? File.read('C:\Users\Denis\krd-practice\lesson-5\balance.txt').to_f : 100.0
  end

  def start
    server = TCPServer.new('0.0.0.0', 3000)

    loop do
      client = server.accept

      request = client.gets
      method, path = request.split(' ')

      case method
      when 'GET'
        case path
        when '/deposit'
          deposit(client)
        when '/withdraw'
          withdrawal(client)
        when '/balance'
          check_balance(client)
        when '/quit'
            exit_program(client)
        else
            client.puts 'HTTP/1.1 200\r\n'
            client.puts 'Content-Type: text/plain; charset=utf-8'
            client.puts ''
            client.puts 'Выберите операцию: 
            /deposit - для внесения наличных
            /withdraw - для вывода наличных
            /balance - для просмотра баланса
            /quit - для выхода из программы'
          end
      else
        client.puts 'HTTP/1.1 405 Method Not Allowed'
        client.puts 'Content-Type: text/plain; charset=utf-8'
        client.puts ''
        client.puts '405 Метод не найден'
      end

      client.close
    end
  end

  private

  def deposit(client)
    client.puts 'HTTP/1.1 200 OK'
    client.puts 'Content-Type: text/plain; charset=utf-8'
    client.puts ''
    client.puts 'Введите сумму депозита:'
    amount = client.gets.chomp.to_f

    if amount > 0
      @balance += amount
      File.write('C:\Users\Denis\krd-practice\lesson-5\balance.txt', @balance)
      client.puts "Ваш новый баланс: #{@balance}"
    else
      client.puts 'Сумма депозита должна быть больше нуля'
    end
  end

  def withdrawal(client)
    client.puts 'HTTP/1.1 200 OK'
    client.puts 'Content-Type: text/plain; charset=utf-8'
    client.puts ''
    client.puts 'Введите сумму вывода:'
    amount = client.gets.chomp.to_f

    if amount > 0 && amount <= @balance
      @balance -= amount
      File.write('C:\Users\Denis\krd-practice\lesson-5\balance.txt', @balance)
      client.puts "Ваш новый баланс: #{@balance}"
    else
      client.puts 'Сумма вывода должна быть больше нуля и меньше или равна текущему балансу.'
    end
  end

  def check_balance(client)
    client.puts 'HTTP/1.1 200 OK'
    client.puts 'Content-Type: text/plain; charset=utf-8'
    client.puts ''
    client.puts "Ваш текущий баланс: #{@balance}"
  end

  def exit_program(client)
    File.write('C:\Users\Denis\krd-practice\lesson-5\balance.txt', @balance)

    client.puts 'HTTP/1.1 200 OK'
    client.puts 'Content-Type: text/plain'
    client.puts ''

    client.puts 'Спасибо за использование нашей программы!'
  end
end

CashMachine.new.start
