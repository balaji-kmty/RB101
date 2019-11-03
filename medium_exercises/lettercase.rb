# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

def letter_percentages(str)
  result_hash = {lowercase: 0.0, uppercase: 0.0, neither: 0.0}
  number_of_chars = str.chars.size.to_f
  str.chars.each do |char|
    result_hash[:lowercase] += (100/number_of_chars) if LOWERCASE.include?(char)
    result_hash[:uppercase] += (100/number_of_chars) if UPPERCASE.include?(char)
    result_hash[:neither] += (100/number_of_chars) if (!LOWERCASE.include?(char) && !UPPERCASE.include?(char))
  end
  result_hash
end

letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
