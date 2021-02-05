duration_string = '4 years, 5 months'

array = duration_string.delete(",").split
new_array = array.select do |element|
                  element.to_i.to_s == element
                end

p new_array
