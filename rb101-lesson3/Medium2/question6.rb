# How could the unnecessary duplication in this method be removed?

# def color_valid(color)
#   if color == "blue" || color == "green"
#     true
#   else
#     false
#   end
# end

#---My Solution---
def color_valid(color)
  (color == "blue" || color == "green") ? true : false
end

p color_valid("blue")

#---LS Solution---
def color_valid(color)
  color == "blue" || color == "green"
end

p color_valid("blue") 