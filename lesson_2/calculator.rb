
puts "Enter first number: "
num_1 = gets.chomp.to_i

puts "Enter second number: "
num_2 = gets.chomp.to_i

puts "Enter mathematical operation (+ - * /): "
operation = gets.chomp

answer = nil

case operation
when '+'
  answer = num_1 + num_2
when '-'
  answer = num_1 - num_2
when '*'
  answer = num_1 * num_2
when '/'
  answer = num_1.to_f / num_2.to_f
else
  puts "Invalid input!"
end

if answer
  puts "#{num_1} #{operation} #{num_2} = #{answer}"
end
