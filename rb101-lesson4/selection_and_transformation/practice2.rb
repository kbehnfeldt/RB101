# remove first element, times it by 2, add to end of array


my_numbers = [1, 4, 3, 7, 2, 6]

# ---My Solution---
# def double_numbers!(numbers)
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     current_number = numbers.shift
#     numbers << current_number * 2

#     counter += 1
#   end

#   numbers
# end 

# ---LS Solution---
def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2

    counter += 1
  end

  numbers
end


p double_numbers!(my_numbers)
p my_numbers