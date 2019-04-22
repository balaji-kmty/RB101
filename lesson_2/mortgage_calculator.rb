
def prompt(message)
  puts "=> #{message}"
end

def validate_get
  num = nil
  loop do
    num = gets.chomp
    if (num.to_f.to_s == num || num.to_i.to_s == num) && (num.to_f > 0)
      break
    else
      prompt 'Invalid input, try again.'
    end
  end
  return num.to_f
end

prompt 'Welcome to Mortgage Calculator'
loan_amount = nil
apr = nil
duration = nil
monthly_rate = nil
duration_months = nil
monthly_payment = nil

loop do
  prompt 'Please enter the loan amount: '
  loan_amount = validate_get

  prompt 'Please enter the Annual Percentage Rate or APR (enter 5 for 5%): '
  apr = validate_get

  prompt 'Please enter the loan duration in years: '
  duration = validate_get

  monthly_rate = apr / 1200
  duration_months = duration * 12

  monthly_payment = loan_amount * (monthly_rate / (1 - (1 + monthly_rate)**(-duration_months)))

  prompt "Monthly payment amount is $#{format('%02.2f',monthly_payment)}"

  prompt 'Another calculation? Y to continue '
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thanks for using the Mortgage Calculator, good bye!'
