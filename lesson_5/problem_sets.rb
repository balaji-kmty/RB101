# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']
puts arr.sort {|a,b| b.to_i <=> a.to_i}

# How would you order this array of hashes based on the year of publication of each book,
# from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

puts books.sort_by {|book| book[:published]}

# For each of these collection objects demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
puts arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
puts arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
puts arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
puts hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
puts hsh2[:third].key(0)

# For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4

p arr1, arr2, hsh1, hsh2

# Given this nested Hash figure out the total age of just the male members of the family.:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
total_male_age = 0

munsters.each do |_, value|
  total_male_age += value["age"] if value["gender"] == "male"
end

puts total_male_age

# Given this previously seen family hash, print out the name, age and gender of each family member:
# ...like this:
# (Name) is a (age)-year-old (male or female).

munsters.each do |key, value|
  puts "#{key} is a #{value["age"]}-year-old #{value["gender"]}"
end

# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, value|
  value.each do |element|
    element.chars.each do |letter|
      puts letter if %w(A E I O U a e i o u).include?(letter)
    end
  end
end

# Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
arr_sorted = []

arr_sorted = arr.map do |sub_arr|
  sub_arr.sort do |a,b|
    b <=> a
  end
end

p arr_sorted

# Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
arr_new = []

arr_new = arr.map do |hsh|
  incremented_hsh = {}
  hsh.each do |key, value|
    incremented_hsh[key] = value + 1
  end
  incremented_hsh
end

p arr_new

# Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr_new = arr.map do |sub_arr|
  sub_arr.select do |element|
    element%3 == 0
  end
end

p arr_new

# Given the following data structure, and without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
hsh = {}

arr.each do |sub_arr|
  hsh[sub_arr[0]] = sub_arr[1]
end
p hsh

# Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
arr_sorted = []

arr_sorted = arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end
p arr_sorted

# Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
arr = []

arr = hsh.map do |key, value|
  if value[:type] == 'fruit'
    value[:colors].map {|color| color.capitalize}
  else
    value[:size].upcase
  end
end
p arr

# Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr_new = arr.select do |hsh|
  hsh.all? do |key, value|
    value.all? {|element| element.even?}
  end
end

p arr_new

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.
# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
# Write a method that returns one UUID when called with no parameters.

def generate_uuid
  hex_set = []
  (0..9).each {|digit| hex_set << digit.to_s}
  ('a'..'f').each {|letter| hex_set << letter}

  uuid = ""
  pattern = [8, 4, 4, 4, 12]

  pattern.each_with_index do |section, index|
    section.times {uuid += hex_set.sample}
    uuid += '-' unless index >= pattern.size - 1
  end

  uuid
end

p generate_uuid
