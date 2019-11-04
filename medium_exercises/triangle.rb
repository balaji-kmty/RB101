# Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

# You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

def valid?(angles)
  angles.reduce(:+) == 180 && angles.min > 0
end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  return :invalid unless valid?(angles)
  if angles.include?(90)
    :right
  elsif angles.max < 90
    :acute
  else
    :obtuse
  end
end

triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid
