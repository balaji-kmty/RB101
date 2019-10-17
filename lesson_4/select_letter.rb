def select_letter (question_string, letter)
  letter_string = ''
  counter = 0

  loop do
    break if counter == question_string.size
    letter_string << question_string[counter] if question_string[counter] == letter
    counter += 1
  end

  letter_string
end

question = 'How many times does a particular character appear in this sentence?'
puts select_letter(question, 'a') # => "aaaaaaaa"
puts select_letter(question, 't') # => "ttttt"
puts select_letter(question, 'z') # => ""
