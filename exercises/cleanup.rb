# Given a string that consists of some words and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

ALPHABETS = ('a'..'z').to_a + ('A'..'Z').to_a

def cleanup(str)
  temp_str = []
  str.chars.each do |char|
    if ALPHABETS.include?(char)
      temp_str << char
    else
      temp_str << ' '
    end
  end
  temp_str.join.squeeze
end

cleanup("---what's my +*& line?") == ' what s my line '
