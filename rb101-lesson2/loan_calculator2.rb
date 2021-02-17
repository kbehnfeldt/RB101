require 'yaml'
MESSAGES = YAML.load_file('loan_calculator.yml')

# ---Updated after reviewing LS solution---

# method to add => at promtps
def prompt(message)
  puts "=> #{message}"
end

# Loan amount validation
def loan_amount_valid?(loan_amount)
  loan_amount.delete!(',')
  loan_amount.to_i.to_s == loan_amount || loan_amount.to_f.to_s == loan_amount
end

# APR validation and conversion to float
def apr_valid?(apr_number)
  apr_number = apr_number.to_f
  if apr_number == 0 || apr_number < 0.09
    false
  else 
    apr_number /= 100
  end
end

# Loan duration validation
def loan_duration_valid?(duration_string)
  array = duration_string.delete(",").split
  new_array = array.select do |element|
                    element.to_i.to_s == element
                  end

  unless  new_array.length == 2
    false
  else
    years, months = new_array
    result =  (years.to_i * 12) + months.to_i
  end
end

prompt(MESSAGES['welcome'])

# main loop
loop do

  # input for loan amount
  loan_amount = nil
  loop do
    prompt(MESSAGES['loan_amount'])
    loan_amount = gets.chomp

    if loan_amount_valid?(loan_amount)
      loan_amount = loan_amount.to_f
      break
    else
      prompt(MESSAGES['loan_amount_invalid'])
    end
  end

  # get APR from user and convert to monthly interest rate
  monthly_interest_rate = nil
  loop do
    prompt(MESSAGES['APR'])
    apr = gets.chomp
    monthly_interest_rate = apr_valid?(apr)

    unless monthly_interest_rate
      puts prompt(MESSAGES['APR_invalid'])
    else
      monthly_interest_rate /= 12
      break
    end
  end

  # get loan duration from user
  loan_duration_months = nil
  loop do
    prompt(MESSAGES['loan_duration'])
    loan_duration = gets.chomp

    loan_duration_months = loan_duration_valid?(loan_duration)

    if loan_duration_months == false || loan_duration_months == 0
      prompt(MESSAGES['duration_invalid'])
    else
      loan_duration_months
      break
    end
  end

  # monthly payment calculation
  monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))

  # puts prompt("The monthly payment will be $#{monthly_payment.round(2)}")
  
  # Code from LS solution
  prompt("Your monthly payment is: $#{format('%.2f', monthly_payment)}")

  # ask to calculate another loan or exit
  prompt(MESSAGES['go_again?'])
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')

end

puts prompt(MESSAGES['thanks_for_using'])