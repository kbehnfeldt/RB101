
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select! do |_, value|
  value < 100
end

p ages


# ---LS Solution---
ages.keep_if { |_, age| age < 100 }