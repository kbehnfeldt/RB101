=begin
Input: An array of strings
Output: An integer

Rules:
  The output integer will be the index of the first element beginning with "Be"
  The first element beginning widh "Be" will be selected. No other ones
  Only one element will be chosen, then the program will stop searching.

Data Structure:
  Array
  String
  integer
  Array#index

---Algorithm---
Create an empty array `starts_with_be`

Iterate through the array
  check each name to see if it begins with "Be"
    If it does, push that name to `starts_with_be`
  
find the index of the first name in the `starts_with_be` array in the flintstones array

=end


flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# ---Solution 1---

# starts_with_be = Array.new

# flintstones.each do |name|
#   if name.start_with?("Be")
#     starts_with_be << name
#   end
# end

# puts flintstones.index(starts_with_be[0])

# ---Solution 2---

# counter = 0

# loop do
#   break if counter == flintstones.size
  
#   puts counter if flintstones[counter].start_with?("Be")
    
#   counter += 1
# end

# ---LS Solution---

flintstones.index { |name| name[0, 2] == "Be" }