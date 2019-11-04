# Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.
require 'date'

def friday_13th(year)
  Date.new(year).step(Date.new(year, -1, -1)).select { |day| day.friday? && day.mday == 13 }.size
end

# An interesting variation on this problem is to count the number months that have five Fridays. This one is harder than it sounds since you must account for leap years.

def five_friday(year)
  month_count = 0
  1.upto(12) do |month|
    fridays = Date.new(year, month, 1).step(Date.new(year, month, -1)).select { |day| day.friday? }.size
    month_count += 1 if fridays == 5
  end
  month_count
end

friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2
p five_friday(2015)
p five_friday(2000)
