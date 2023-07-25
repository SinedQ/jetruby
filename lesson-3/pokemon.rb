def pokemon
    print 'Укажите сколько вы хотите добавить покемонов: '
    count_pokemon = gets.chomp().to_i

    pokemon_list = []
    count_pokemon.times do
        puts 'Введите имя покемона: '
        name = gets.chomp
        puts 'Введите цвет покемона: '
        color = gets.chomp
        pokemon_list << {name: name, color: color}
    end
    pokemon_list
end

pokemon