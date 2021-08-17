=begin

set an empty hash, `output_hash`

iterate through the array `arr`
  assign the following to `output_hash`
    take the first element and make it the key
    take the second eluement and make it the value
  
print `output_hash`


=end


arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]


output_hash = Hash.new

arr.each do |sub_arr|
  output_hash[sub_arr[0]] = sub_arr[1]
end

p output_hash == {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}