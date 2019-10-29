def multisum(num)
  arr = []
  arr = *(1..num).select { |n|  n % 3 == 0 || n % 5 == 0 }
  arr.reduce(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
