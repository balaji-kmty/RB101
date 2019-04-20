require 'yaml'
MESSAGES = YAML.load_file('calc_messages.yml')
LANGUAGE = 'en'

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  puts "=> #{message}"
end

def valid_number?(num)
  (num.to_i.to_s == num) || (num.to_f.to_s == num)
end

def number_get
  num = nil
  loop do
    num = gets.chomp
    if valid_number?(num)
      break
    else
      prompt('invalid_input')
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
prompt('welcome')

loop do
  prompt('first_number')
  num1 = number_get

  prompt('second_number')
  num2 = number_get

  prompt('operation')
  operation = nil
  loop do
    operation = gets.chomp
    if %w(+ - * /).include?(operation)
      break
    else
      prompt('invalid_input')
    end
  end

  puts "=> #{operator_to_method(operation)}..."
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

  puts "=> #{num1} #{operation} #{num2} = #{answer}"

  prompt('another_operation')
  cont = gets.chomp.downcase
  break unless cont.start_with?('y')
end

prompt('thanks')
