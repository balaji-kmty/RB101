# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.
#
# You may (and should) use the substrings_at_start method you wrote in the previous exercise:

def substrings(str)
  str_arr = str.split('')
  result = []
  loop do
    seq = ''
    result << str_arr.map { |char| seq += char }
    str_arr.shift
    break if str_arr.length == 0
  end
  result.flatten
end

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
