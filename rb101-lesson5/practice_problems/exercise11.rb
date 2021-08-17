=begin
num % 3 == 0
map iterate through top array
select iterate though sub array


=end

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

p (arr.map do |sub_arr|
  sub_arr.select do |ele|
    ele % 3 == 0
  end
end)