=begin
Input: An array of strings
Output: A hash made from the array

Rules:
  The ouput hash should have each name as a key and the index of that name in the array as a value
  The output will be a new hash

Data Structure:
  hash = { 'name'=>0, 'name'=>1, 'name'=>2 ... }
  use hash
  use array

---Algorithm---
create an empty hash called `hash`

set a method definition named `name_and_index` that takes 2 arguments, `names` and `hash`
  Iterate over each element in the `names `array
    create an variable `count` set to 0
    assign each element of the array as a key in `hash`
    assign the current value of `count` as the value to go with the current key.
    return `hash`

invoke `name_and_index` and output the hash



=end


flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hash = Hash.new

# def name_and_index(names, hash)
#   count = 0
#   names.each do |name|
#     hash[name] = count
#     count += 1
#   end

#   hash
# end

# def name_and_index(names, hash)
#   count = 0
#   loop do
#     break if count >= names.size

#     hash[names[count]] = count
#     count += 1
#   end

#   hash
# end

# p name_and_index(flintstones, hash)

# ---LS Solution---
flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

p flintstones_hash