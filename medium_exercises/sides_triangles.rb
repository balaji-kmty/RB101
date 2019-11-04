# Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

def valid?(tri)
  max_position = tri.find_index(tri.max)
  tri.reduce(:+) - tri[max_position] > tri[max_position]
end

def triangle(one, two, three)
  triangle = [one, two, three]
  return :invalid unless valid?(triangle)
  if one == two && one == three
    :equilateral
  elsif (one == two || two == three || one == three)
    :isosceles
  else
    :scalene
  end
end

triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid
