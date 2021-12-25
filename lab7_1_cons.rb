require_relative 'lab7_1_main'

puts "Введите n: "
n = gets.chomp.to_i

func(Array.new(10) { Random.rand(1..20) }, n)
puts "Файл F успешно создан"

scndf 
puts "Файл P успешно создан"