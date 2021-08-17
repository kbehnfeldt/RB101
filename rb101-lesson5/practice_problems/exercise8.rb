=begin
iterate through each value
  iterate through each element in each array
    separate the characters in each string
    if the character is a vowel, oputut the character (#include?)


=end

VOWELS = 'aeiou'

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |array|
  array.each do |string|
    string.each_char do |character|
      puts character if VOWELS.include?(character)
    end
  end
end