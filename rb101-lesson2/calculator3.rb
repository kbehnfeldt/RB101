require 'yaml'
MESSAGES = YAML.load_file('calculator3_messages.yml')

# Adds => to beginning of each prompt
def prompt(message)
  Kernel.puts("=> #{message}")
end

# Number input vaildation and conversion to integer or float
def valid_number?(num)
  if num.to_i.to_s == num
    num.to_i
  elsif num.to_f.to_s == num
    num.to_f
  else
    false
  end
end


# Method to tell user what operation is being performed
def operation_to_message(op)
  word = case op
          when '1'
            'Adding'
          when '2'
            'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
         end
  word
end

# To capture the users name
prompt(MESSAGES['welcome'])

name = ""
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hello #{name}")

# main loop
loop do 

  #To capture the first number
  number1 = ''
  loop do
    prompt(MESSAGES['first_number'])
    number1 = Kernel.gets().chomp()

    if valid_number?(number1) == false
      prompt(MESSAGES['invalid_number'])
    else
      number1 = valid_number?(number1)
      break
    end
  end

  # To capture the second number
  number2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    number2 = Kernel.gets().chomp()

    if valid_number?(number2) == false
      prompt(MESSAGES['invalid_number'])
    else
      number2 = valid_number?(number2)
      break
    end
  end

# Heredoc for operator format
  operator_prompt = <<-MSG    
What operation would you like to perform? 
    1) add 
    2) subtract 
    3) multiply 
    4) divide
  MSG

  # To capture the operator
  prompt(operator_prompt)
  
  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['invalid_choice'])
    end
  end

    # lets the user know what operation is being performed
  prompt("#{operation_to_message(operator)} the two numbers...")

    result = case operator
              when '1'
                number1 + number2
              when '2'
                number1 - number2 
              when '3'
                number1 * number2
              when '4' 
                number1.to_f / number2.to_f
             end

  prompt("The result is #{result}")
  
  # To repeat or exit Calculator
  prompt(MESSAGES['go_again'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

Kernel.puts(MESSAGES['goodbye'])
