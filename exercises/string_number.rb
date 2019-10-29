DIGITS = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
          '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

HEXADECIMAL = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
               '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
               'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15}

def string_to_integer(str)
  arr = str.split("")
  arr.map! { |a| DIGITS[a] }
  arr_length = arr.length
  int = 0

  arr.each_with_index { |num, idx| int += num * 10**(arr_length-1-idx) }
  int
end

def hexadecimal_to_integer(str)
  arr = str.upcase.split("")
  arr.map! { |a| HEXADECIMAL[a] }
  arr_length = arr.length
  int = 0

  arr.each_with_index { |num, idx| int += num * 16**(arr_length-1-idx) }
  int
end

def string_to_signed_integer(str)
  arr = str.split("")
  if arr[0] == '-'
    return (-string_to_integer(arr.pop(arr.length-1).join('')))
  elsif arr[0] == '+'
    return string_to_integer(arr.pop(arr.length-1).join(''))
  else
    return string_to_integer(str)
  end
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('9864')
p hexadecimal_to_integer('4D9f') == 19871
p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
