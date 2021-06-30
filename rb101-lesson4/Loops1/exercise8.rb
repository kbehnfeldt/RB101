numbers = [7, 9, 13, 25, 18]

# until numbers.empty?
#   num = numbers.shift
#   puts num
# end

count = 0

until count >= numbers.length
  puts numbers[count]
  count += 1
end