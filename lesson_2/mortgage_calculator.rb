
def prompt(message)
  p "=> #{message}"
end

prompt 'Welcome to Mortgage Calculator'

prompt 'Please enter the loan amount: '
loan_amount = gets.chomp

prompt 'Please enter the Annual Percentage Rate or APR (enter 5 for 5%): '
apr = gets.chomp

prompt 'Please enter the loan duration in years: '
duration = gets.chomp

monthly_rate = apr.to_f / 1200
duration_months = duration.to_f * 12

monthly_payment = loan_amount.to_f * (monthly_rate / (1 - (1 + monthly_rate)**(-duration_months)))

prompt "Monthly payment amount is #{monthly_payment}"
