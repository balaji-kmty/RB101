# Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

def find_fibonacci_index_by_length(idx)
  fibonacci_arr = [1, 1]
  return 1 if idx == 1
  loop do
    fibonacci_arr << fibonacci_arr[-1] + fibonacci_arr[-2]
    break if fibonacci_arr[-1].to_s.length >= idx
  end
  fibonacci_arr.length
end

find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847
