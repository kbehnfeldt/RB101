=begin
Only return hashes where ALL of the integers are even

#all? #each 

set an empty hash, `even_integers`

iterate through `arr` (#each)
  iterate through each value in each hash
    if every integer in value is even (#all?)
      add that key-value pair to `even_integers`
  
print `even_integers`
    
=end

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# ---My Solution---

even_integers = Hash.new

arr.each do |hash|
  hash.each do |key, value|
    even_integers[key] = value if value.all? { |num| num.even? }
  end
end

p even_integers

# ---LS Solution---

arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end
# => [{:e=>[8], :f=>[6, 10]}]