=begin
Input: A string
Output: A string

Rules:
  The first letter of each word needs to be capitalized
    Only the first letter
    The first letter of the string and each letter following a space
  Make a method called `titleize`

Data Structure:
  String
  Array?
  String#split(' ')
  String#capitalize
  Array#join(' ')
  
---Algorithm---
Create a method called `titleize` that takes one argument `string`
Separate the string by spaces to have each word as an element in an array called `words_array`
Iterate over `words_array`
  Capitalize the first letter of each string element in `words_array`.
combine each element in `words_array` and separate each element with a space


=end

words = "the flintstones rock"

def titleize(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

p titleize(words)
p words

# ---LS Solution---
words.split.map { |word| word.capitalize }.join(' ')