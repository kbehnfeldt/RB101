=begin

'!' indicates that the method will mutate the caller. 
  It also changes a boolean expression to it's opposite

'?' indicates that the method will return a boolean value (true or false)

1. what is != and where should you use it?
  != is a comparison operator that compares two operands and returns true if they do not have the same value.
  It should be used to return a true boolean value when two operands are not the same.

2. put ! before something, like !user_name
  I think it will change the 'truthy' value of the variable to false??

3. put ! after something, like words.uniq!
  This will mutate the caller

4. put ? before something
  I don't know
  
5. put ? after something
  A method that ends with ? will return a boolean value
  
6. put !! before something, like !!user_name
  This forces the variable to return a boolean value. 


---Answers---

Just to clarify, if you see ! or ? at the end of the method, it's actually part of the method name, and not Ruby syntax.
Therefore, you really don't know what the method is doing, 
even if it ends in those characters -- it depends on the method implementation. The other uses are actual Ruby syntax:

!= means "not equals"
? : is the ternary operator for if...else
!!<some object> is used to turn any object into their boolean equivalent. (Try it in irb)
!<some object> is used to turn any object into the opposite of their boolean equivalent, just like the above, but opposite.

=end