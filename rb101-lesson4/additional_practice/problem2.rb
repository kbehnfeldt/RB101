=begin
Input: A hash with strings for keys and integers for values
Output: All of the values(integers) added together

Rules:
  Add the values and output the number

Data Structure:
  Hash
  Integer
  #each_value

---Algorithm---
set `result` with a value of 0
iterate through the `ages` hash and add each value to `result`
output result

=end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
result = 0

ages.each_value { |age| result += age }

puts result

# ---LS Solution---
ages.values.inject(:+) # => 6174