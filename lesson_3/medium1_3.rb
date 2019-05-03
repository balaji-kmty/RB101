def factors(number)
  divisor = number
  factors = []

  return "Invalid input, must provide positive integer" if divisor <=0

  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

puts factors(100)
