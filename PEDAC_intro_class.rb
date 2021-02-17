=begin

 INSTRUCTIONS

Implement a function that calculates the sum of the integers inside a string. E.g. "L12aun3ch Sch3oo45l"

Note: only positive integers will be tested.

# PROBLEM
- input: string
- output: integer
- only positive integers are added to the sum
- need to extract digits out of the string
- need to convert the string (numbers) into integers
- we need the sum of all those ^ integers in the string
- question: is 0 a positive integer?
- question: what do we do with the sum? Does the methd return it?
- question: is '45' 4 + 5 or 45?

# EXAMPLES
p sum_of_integers("HE2LL3O W1OR5LD") == 11
p sum_of_integers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635
p sum_of_integers("HELLO WORLD!") == 0

- '45' is 45 not 4 & 5
- 0 is 0
- the sum is returned at the end of the method
- method name: sum_of_integers
- all characters are alphanumeric or '!' or ' '
- if there are no numbers in the string, return 0'

DATA STRUCTURES
- strings
- integers
- array (use some of its methods?)

MY ALGORITHM

take the string separate each character.
store the result as an array
if there are numbers next to eachother in the array, join them as one number string
remove any letters or symbols
convert each remaining string in the array to an integer
sum all of the integers
return the sum of the integers

TA ALGORITHM

- create sum and set to 0
- create a placeholder for the current number
- iterate over each character of the string
  - if the current character is a number
    - put it at the end of the current number string
  - if the current character isn't a number
    - add the number to the sum
    - reset number to an empty string
- return sum 

=end


def sum_of_integers(string)
sum = 0
current_num = ''
string.each_char do |element|
  if element.to_i.to_s == element
    current_num << element 
  else
    sum += current_num.to_i
    current_num = ''
  end
  sum += current_num.to_i

 sum
end

p sum_of_integers("HE2LL3O W1OR5LD") == 11
p sum_of_integers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635
p sum_of_integers("HELLO WORLD!") == 0
p sum_of_integers("HELLO WORLD!55") == 55