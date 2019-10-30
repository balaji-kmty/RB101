MINUTES = 60
HOURS = 24
DAY = HOURS * MINUTES  # minutes in a day

def time_of_day(min)
  min = min % DAY
  hr, mn = min.divmod(MINUTES)
  p format('%02d:%02d', hr, mn)
end

time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
