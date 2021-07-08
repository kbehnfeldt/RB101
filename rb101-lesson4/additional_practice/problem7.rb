=begin
Input: A string
Output: A hash of strings and integers

Rules:
  Capital and lowercase letters do not count as the same letter
  Key will be the letter in string form
  Value will be an integer that equals the number of times that letter occures
  spaces should not be counted

Data Structure:
  Hash
  Array
  String
  Integer
  #chars
  Output example: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

---Algorithm---
create a method definition named `number_of_occurances` that takes one argument, `string`
set an empty hash called `occurances_hash`
Take `string` and separate each character into an array called `characters`
Remove the staces from `characters`
Iterate through the `characters` array
  If `occurances_hash` has a key that is the same as the current letter, increase the value (number) by 1
  If `occurances_hash` does not have a key that is the same as the current letter, add the key to the hash
      and set the value to 1
Return `occurances_hash`


=end

statement = "The Flintstones Rock"

def number_of_occurances(string)
  occurances_hash = Hash.new
  characters = string.chars.delete_if { |character| character == ' ' }

  characters.each do |letter|
    if occurances_hash.key?(letter)
      occurances_hash[letter] += 1
    else
      occurances_hash[letter] = 1
    end
  end

  occurances_hash
end

puts number_of_occurances(statement)

# ---LS Solution---
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end