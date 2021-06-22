# def factors(number)
#   divisor = number
#   factors = []
#   begin
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end until divisor == 0
#   factors
# end

#---My Solution---

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << (number / divisor) if number % divisor == 0 # The current divisor is only a factor of the number if divisor/number does not leave a remainder
    divisor -= 1
  end
  factors # This line implicitly returns the factors array when the method is completed. Without this line, the method would return the return value of while, which is nil.
end

p factors(12)
p factors(4)
p factors(0)

#---LS Solution---

# while divisor > 0 do
#   factors << number / divisor if number % divisor == 0
#   divisor -= 1
# end
