# The Ruby Array class has several methods for removing items from the array. 
# Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original array between method calls)?

p numbers.delete_at(1)
p numbers.delete(1)

=begin

---My Answer---
#delete_at(1) will remove and return the element at index 1 in the array. The integer 2 in this example
#delete(1) will remove and return every element in the array that is the same value as the argument.
  The integer 1 in this example

---Answer---
numbers.delete_at(1) # numbers is now [1, 3, 4, 5]
(note that the array is operated on directly and the return value of the call is the removed item 2)

numbers.delete(1) # numbers is now [2, 3, 4, 5]
(note that the array is operated on directly and the return value of the call is the removed item 1)

Another thing to notice is that while both of these methods operate on the contents of the referenced array 
  and modify it in place (rather than just returning a modified version of the array) 
  these methods do NOT have the usual ! at the end of the method name for "modify in place" method names.

=end