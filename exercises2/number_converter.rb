# Write a method that takes a positive integer as an argument and returns that number with its digits reversed. Examples:

def reversed_number(num)
  arr = []
  reverse = 0
  loop do
    num, remainder = num.divmod(10)
    arr << remainder
    break if num == 0
  end
  arr.each_with_index do |value, idx|
    reverse += value * 10 ** (arr.length - idx - 1)
  end
  reverse
end

reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1
