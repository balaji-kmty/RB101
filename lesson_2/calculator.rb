def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num
end

def number_get
  num = nil
  loop do
    num = gets.chomp
    if valid_number?(num)
      break
    else
      prompt'Invalid input, try again: '
    end
  end
  num
end

def operator_to_method(operator)
  case operator
  when '+'
    'Adding'
  when '-'
    'Subtracting'
  when '*'
    'Multiplying'
  else
    'Dividing'
  end
end

num1 = nil
num2 = nil
prompt'Welcome to Calculator!'

loop do
  prompt'Enter first number: '
  num1 = number_get

  prompt'Enter second number: '
  num2 = number_get

  prompt'Enter mathematical operation (+ - * /): '
  operation = nil
  loop do
    operation = gets.chomp
    if %w(+ - * /).include?(operation)
      break
    else
      prompt'Invalid input, try again!'
    end
  end

  prompt"#{operator_to_method(operation)}..."
  sleep 0.5

  answer = case operation
           when '+'
             num1.to_i + num2.to_i
           when '-'
             num1.to_i - num2.to_i
           when '*'
             num1.to_i * num2.to_i
           else
             num1.to_f / num2.to_f
           end

  prompt"#{num1} #{operation} #{num2} = #{answer}"

  prompt'Would you like to perform another operation? (Y to continue)'
  cont = gets.chomp.downcase
  break unless cont.start_with?('y')
end

prompt'Thanks for using the calculator, good bye!'
