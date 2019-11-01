# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.
#
# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

def lights(n)
  arr = Array.new(n, false)
  n.times do |count|
    arr.each_with_index { |element, idx| arr[idx] = !element if (idx + 1) % (count + 1) == 0}
  end
  result =[]
  arr.each_with_index { |element, idx| result << idx+1 if element }
  result
end

lights(1000)
