=begin
sub arrays are sorted based on odd numbers in each sub array

sort_by and select


=end

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

p (arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end)