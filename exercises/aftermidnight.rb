# Write two methods that each take a time of day in 24 hour format, and return
# the number of minutes before and after midnight, respectively. Both methods
# should return a value in the range 0..1439.
# You may not use ruby's Date and Time methods.
MINUTES = 60
HOURS = 24
DAY = HOURS * MINUTES  # minutes in a day

def after_midnight(str)
  arr = str.split(':')
  time = (arr[0].to_i % 24) * MINUTES + arr[1].to_i
  p time
end

def before_midnight(str)
  arr = str.split(':')
  time = (DAY - ((arr[0].to_i % 24) * MINUTES + arr[1].to_i))
  time = 0 if time == DAY
  p time
end

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0
