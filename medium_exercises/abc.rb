# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
#
# This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.
#
# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

BLOCKS = [['B', 'O'], ['H', 'U'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'], ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

def block_word?(str)
  arr = str.upcase.chars
  flag = 0
  BLOCKS.each do |block|
    flag = 0
    arr.each do |char|
      flag += 1 if block.include?(char)
    end
    break if flag == 2
  end
  flag < 2 ? flag = true : flag = false
  return flag
end

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true
