# Write a method that takes a string, and returns a new string in which every character is doubled.

def repeater(str)
  str.chars.zip(str.chars).flatten.join
end

repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

VOWELS = %w(a e i o u A E I O U)
ALPHABETS = ('a'..'z').to_a + ('A'..'Z').to_a

def double_consonants(str)
  str.chars.map do |char|
    # binding.pry
    if VOWELS.include?(char)
      char
    elsif ALPHABETS.include?(char)
      char *= 2
    else
      char
    end
  end.join
end

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""
