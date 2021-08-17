
=begin
return COLORS of FRUIT and SIZE of VEGETABLES
colors are capitalized
sizes are uppercase

Iterate through values in `hsh` (map)
  if key :type is 'fruit'
    iterate through the array(value) (map)
      capitalize each string
  if key :type is 'vegetable'
    uppercase the string(value)

=end

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}


p (hsh.map do |_, details|
  if details[:type] == 'fruit'
    details[:colors].map { |color| color.capitalize }
  else
    details[:size].upcase
  end
end)