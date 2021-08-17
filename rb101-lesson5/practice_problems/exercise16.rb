# hexadecimal = 0-9 + a-f

HEXADECIMAL = ('0'..'9').to_a + ('a'..'f').to_a

def uuid_generator
  uuid1 = [0, 0, 0, 0, 0, 0, 0, 0]
  uuid2 = [0, 0, 0, 0]
  uuid3 = [0, 0, 0, 0]
  uuid4 = [0, 0, 0, 0]
  uuid5 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

  uuid = [uuid1, uuid2, uuid3, uuid4, uuid5]
  uuid = uuid.map do |section|
    section.map do |num|
      num.to_s
      num = HEXADECIMAL.sample
    end
  end

  uuid.map { |sub_arr| sub_arr.join }.join('-')
end

p uuid_generator