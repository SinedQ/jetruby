students = File.readlines('C:\Users\Denis\krd-practice\lesson-4\students.txt')
results_file = File.open('C:\Users\Denis\krd-practice\lesson-4\results.txt', 'w')

loop do
  print 'Введите возраст студента или -1 для выхода: '
  age = Integer(gets) rescue nil

  break if age == -1

  if age && age.positive?
    found_student = false
    students.each do |student|
      name, surname, student_age = student.chomp.split(' ')
      if student_age.to_i == age
        results_file.puts "#{name} #{surname} #{student_age}"
        found_student = true
      end
    end

    puts 'Студентов с таким возрастом не найдено' unless found_student
  else
    puts 'Некорректный ввод. Введите положительное число.'
  end
end

results_file.close

File.readlines('C:\Users\Denis\krd-practice\lesson-4\results.txt').each do |line|
  puts line
end
