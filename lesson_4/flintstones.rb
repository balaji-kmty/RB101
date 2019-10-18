flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones.map!.with_index {|element, i| element = [element, i]}
flintstones = flintstones.to_h

puts flintstones

# Find the index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.index {|name| name[0,2] == 'Be'}

# Amend this array so that the names are all shortened to just the first three characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! {|member| member[0,3]}
puts flintstones

# Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency>0
end

puts result

# Write your own version of the rails titleize implementation.
words = "the flintstones rock"

puts words.split.map! {|word| word.capitalize}.join (' ')
