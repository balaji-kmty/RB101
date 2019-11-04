# Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

def sum_square_difference(num)
  arr = (1..num).to_a
  sum = arr.reduce(:+)
  square_sum = arr.reduce { |sum, n| sum + n**2 }
  sum**2 - square_sum
end

sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150
