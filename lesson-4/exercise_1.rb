MACHINE_BRANDS_LIST_PATH = 'C:\Users\Denis\krd-practice\lesson-4\brends.txt'
BUFFER = 'C:\Users\Denis\krd-practice\lesson-4\buffer.txt'

def index
    File.foreach(MACHINE_BRANDS_LIST_PATH) { |brends| puts brends}
end
  
def find(id)
    File.foreach(MACHINE_BRANDS_LIST_PATH).with_index do |brends, index|
        if id == index
            puts brends
        end
    end
end
  
def where(pattern)
    File.foreach(MACHINE_BRANDS_LIST_PATH).with_index do |brends, index|
        @brends_id = index if brends.downcase.include?(pattern.downcase)
       end
    
       puts @brends_id
end
  
def update(id, text)
    file = File.open(BUFFER, 'w')
    File.foreach(MACHINE_BRANDS_LIST_PATH).with_index do |brends, index|
        file.puts(id == index ? text : brends)
    end
    
    file.close
    File.write(MACHINE_BRANDS_LIST_PATH, File.read(BUFFER))

    File.delete(BUFFER) if File.exist?(BUFFER)
end
  
def delete(id)
    file = File.open(BUFFER, 'w')
    File.foreach(MACHINE_BRANDS_LIST_PATH).with_index do |brends, index|
        file.puts(id == index ? '' : brends)
    end
    
    file.close
    File.write(MACHINE_BRANDS_LIST_PATH, File.read(BUFFER))

    File.delete(BUFFER) if File.exist?(BUFFER)
end

def create(name)
    File.write(MACHINE_BRANDS_LIST_PATH, name, mode: 'a')
end
  
def main
    loop do
        print 'Введите I, чтобы посмотреть марки машин, F, чтобы найти марку машины по ее id, W, чтобы найти марку машины по ее названию,
        U, чтобы обновить марку машины, D, чтобы удалить марку машины из списка, C, чтобы добавить или Q, чтобы выйти: '
        action = gets.chomp.downcase
      
        case action
        when 'i'
          inedx
        when 'f'
            print 'Введите id строки которую хотите найти: '
            find_id = gets.chomp().to_i
            find(find_id)
        when 'w'
            print 'Введите марку машины: '
            where_patern = gets.chomp
            where(where_patern)
        when 'u'
            print 'Введите id строки, которую хотите заменить: '
            update_id = gets.chomp().to_i
            print 'Введите марку машины на которую хотите заменить прошлую: '
            update_text = gets.chomp
            update(update_id, update_text)
        when 'd'
            print 'Введите id строки, которую хотите удалить: '
            delete_id =gets.chomp().to_i
            delete(delete_id)
        when 'c'
            print 'Введите название марки мышины, которую хотите добавить: '
            create_name = gets.chomp
            create(create_name)
        when 'q'
          puts 'Спасибо за использование нашей программы!'
          exit
        else
          puts 'Неправильный ввод. Пожалуйста, попробуйте еще раз'
        end
      end
end

main