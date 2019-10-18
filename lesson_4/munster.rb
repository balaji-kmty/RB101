# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
total_age = 0

ages.each {|_, age| total_age += age}
puts total_age

# In the age hash remove people with age 100 and greater.
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

puts ages.reject {|k,v| v>100}

# Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
min_age = nil

ages.each {|_, age|
  if min_age == nil
    min_age = age
  elsif min_age > age
    min_age = age
  else
    next
  end
}

puts min_age

# Modify the hash such that each member of the Munster family has an additional "age_group"
# key that has one of three values describing the age group the family member is in (kid, adult, or senior).

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.map do |name, attributes|
  if attributes["age"] <= 17
    attributes["age_group"] = "kid"
  elsif attributes["age"] <= 64
    attributes["age_group"] = "adult"
  else
    attributes["age_group"] = "senior"
  end
end

puts munsters
