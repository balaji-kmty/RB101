DIGITS = {0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
          5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }

def integer_to_string(num)
  arr = []
  loop do
    arr.unshift(num % 10)
    num = num/10
    break if num == 0
  end
  arr.map { |a| DIGITS[a] }
  arr.join('')
end

def signed_integer_to_string(num)
  if num > 0
    return "+" + integer_to_string(num)
  elsif num == 0
    return '0'
  else
    return "-" + integer_to_string(-num)
  end
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
