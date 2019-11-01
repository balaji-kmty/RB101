# Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

def fibonacci(num)
  return 1 if num <= 2
  fibonacci(num-1) + fibonacci(num-2)
end

fibonacci(1) == 1
fibonacci(2) == 1
fibonacci(3) == 2
fibonacci(4) == 3
fibonacci(5) == 5
fibonacci(12) == 144
fibonacci(20) == 6765
