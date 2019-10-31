# Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.
#
# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.

# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly
#
# Do you walk your blue dog quickly? That's hilarious!

madlibs = { :noun => '', :verb => '', :adjective => '', :adverb => '' }

madlibs.each do |key, value|
  if key.to_s == 'noun' || key.to_s =='verb'
    print "Enter a #{key}: "
  else
    print "Enter an #{key}: "
  end
  madlibs[key] = gets.chomp
end

sentence_1 = "Do you #{madlibs[:verb]} your #{madlibs[:adjective]} #{madlibs[:noun]} #{madlibs[:adverb]}? That's hilarious!"
sentence_2 = "The #{madlibs[:adjective]} #{madlibs[:noun]} #{madlibs[:verb]}s #{madlibs[:adverb]} over the lazy dog."
sentence_3 = "The #{madlibs[:noun]} #{madlibs[:adverb]} #{madlibs[:verb]}s up #{madlibs[:adjective]} Joe's turtle."

puts [sentence_1, sentence_2, sentence_3].sample
