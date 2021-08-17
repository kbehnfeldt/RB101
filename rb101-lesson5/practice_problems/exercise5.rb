=begin
set `total_age` to the integer 0
Iterate through the munsters hash
  reference the key 'gender'
    if the value == 'male'
      add the value of the key age to `total_age`
  
output `total_age`

=end



munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0

munsters.each do |_, info|
  total_age += info["age"] if info["gender"] == "male"
end

puts total_age