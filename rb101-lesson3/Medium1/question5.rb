# What's wrong with the code?

#limit = 15

# def fib(first_num, second_num)
#   while first_num + second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end


#---My Solution---

LIMIT = 15

def fib(first_num, second_num)
  while first_num + second_num < LIMIT
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"


#---LS Solution---

# Ben defines limit before he calls fib. But limit is not visible in the scope of fib because 
# fib is a method and does not have access to any local variables outside of its scope.

# You can make limit an additional argument to the definition of the fib method and pass it in when you call fib.