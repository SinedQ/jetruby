class PostsController
    def initialize
      @posts = []
    end
  
    def save_posts_to_file(file_name)
      File.open(file_name, "w") do |file|
        @posts.each do |post|
          file.puts post
        end
      end
    end
  
    def load_posts_from_file(file_name)
      file_contents = File.read(file_name)
      @posts = file_contents.split("\n")
    end
  
    def run
      puts "С каким ресурсом вы хотите взаимодействовать?"
      resource = gets.chomp.downcase
  
      case resource
      when "index"
        get_index
      when "show"
        get_show
      when "create"
        post_create
      when "update"
        put_update
      when "destroy"
        delete_destroy
      else
        puts "Ошибка! Неправильный ввод. Пожалуйста, повторите попытку."
      end
    end
  
    def get_index
      if @posts.empty?
        puts "Нет доступных постов."
      else
        @posts.each_with_index do |post, index|
          puts "#{index}. #{post}"
        end
      end
    end
  
    def get_show
      puts "Введите идентификатор поста:"
      post_id = gets.chomp.to_i
  
      if @posts[post_id]
        puts "#{post_id}. #{@posts[post_id]}"
      else
        puts "Пост с идентификатором #{post_id} не найден."
      end
    end
  
    def post_create
      puts "Введите текст поста:"
      post_text = gets.chomp
  
      post_id = @posts.length
      @posts << post_text
  
      puts "Пост создан. Идентификатор поста: #{post_id}. Текст поста: #{post_text}"
  
      save_posts_to_file("posts.txt")
    end
  
    def put_update
      puts "Введите идентификатор поста:"
      post_id = gets.chomp.to_i
  
      if @posts[post_id]
        puts "Введите новый текст поста:"
        new_post_text = gets.chomp
  
        @posts[post_id] = new_post_text
  
        puts "#{post_id}. #{@posts[post_id]}"
  
        save_posts_to_file("posts.txt")
      else
        puts "Пост с идентификатором #{post_id} не найден."
      end
    end
  
    def delete_destroy
      puts "Введите идентификатор поста:"
      post_id = gets.chomp.to_i
  
      if @posts[post_id]
        @posts.delete_at(post_id)
        puts "Пост с идентификатором #{post_id} удален."
  
        save_posts_to_file("posts.txt")
      else
        puts "Пост с идентификатором #{post_id} не найден."
      end
    end
  end
  
  controller = PostsController.new
  controller.load_posts_from_file('posts.txt')
  controller.run
  