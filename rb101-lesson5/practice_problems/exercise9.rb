

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

p (arr.map do |sub_array|
  sub_array.sort { |a, b| b <=> a }
end)