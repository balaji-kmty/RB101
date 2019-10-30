# Write a method that will take a short line of text, and print it within a box.

def print_in_box(str)
  size = str.length
  pattern_dash = ''
  pattern_blank = ''
  size.times do |_|
    pattern_dash += '-'
    pattern_blank += ' '
  end
  p "+-#{pattern_dash}-+"
  p "| #{pattern_blank} |"
  p "| #{str} |"
  p "| #{pattern_blank} |"
  p "+-#{pattern_dash}-+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
