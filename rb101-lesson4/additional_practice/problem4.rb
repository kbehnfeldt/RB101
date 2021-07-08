

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# ---Solution 1---

# p ages.values.min


# ---Solution 2---

lowest_age = 99999999999
counter = 0

loop do
  break if counter == ages.size

  ages_array = ages.values
  if lowest_age > ages_array[counter]
    lowest_age = ages_array[counter]
  end

  counter += 1
end

p lowest_age


# ---LS Solution---
ages.values.min