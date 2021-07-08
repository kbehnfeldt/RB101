=begin
Input: a hash
output: a hash

Rules:
  The original hash should be modified
  the age of each person determies the value with 'age-group'

Data Structure:
  hash
  string
  integer
  case statement
  range (0..17) (18..64) 

---Algorithm---
iterate through each key-value pair
  comparing the age of each entry, add the key 'age-group' and the appropriate value 
    (if age > 65 then add 'age-group'=>'senior) ...

=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# munsters.map do |name, info|
#   case info['age']
#   when (0..17)  then info['age-group'] = 'kid'
#   when (18..64) then info['age-group'] = 'adult'
#   when (65..)   then info['age-group'] = 'senior'
#   end
# end


# ---LS Solution---
munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

p munsters