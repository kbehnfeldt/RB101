=begin
set an empty hash `new_hash`
iterate through `arr` array with each hash as the block argument




=end

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]


p (arr.map do |hash|
  new_hash = Hash.new
  hash.map do |key, integer|
    new_hash[key] = (integer + 1)
  end
  new_hash
end)
