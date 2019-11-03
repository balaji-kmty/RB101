# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

file = 'pg84.txt'
text = File.read(file)
sentences = text.split(/\.|\?|\!/)

longest_sentence_length = 0
longest_sentence = ''

sentences.each do |sentence|
  if sentence.split(' ').size >= longest_sentence_length
    longest_sentence_length = sentence.split(' ').size
    longest_sentence = sentence
  end
end

puts longest_sentence.strip
puts longest_sentence_length
