# Rewrite your recursive fibonacci method so that it computes its results without recursion.

def fibonacci(num)
  first, last = [1, 1]
  3.upto(num) do
    first, last = [last, first+last]
  end
  last
end

p fibonacci(50)

# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

def fibonacci_last(num)
  first, last = [1, 1]
  3.upto(num) do
    first, last = [last, (first+last) % 10]
  end
  last
end

fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4
