# Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

def star(num)
  return "invalid input" if num.even? || num < 7
  star_grid = []
  num.times { star_grid << ' ' * num }
  star_grid.each_with_index do |str, idx|
    str[idx], str[num/2], str[-1-idx] = ['*', '*', '*']
  end
  star_grid[num/2] = ('*' * num)
  puts star_grid
end

star(7)

=begin
*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *
=end

star(9)

=begin
*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *
=end
