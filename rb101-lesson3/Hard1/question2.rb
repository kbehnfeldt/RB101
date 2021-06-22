# What does the last line output?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# The output is {:a=>"hi there"}

=begin
The local variable does not store the return value, it stores the original argument.
    Also, Object#clone
=end