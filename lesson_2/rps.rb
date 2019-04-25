RPS = ['rock', 'paper', 'scissors', 'lizard', 'spock']

def prompt(message)
  puts "=> #{message}"
end

def selection_expand(pick)
  case pick
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 's'
    'scissors'
  when 'l'
    'lizard'
  when 'S'
    'spock'
  else
    prompt "Invalid selection. Enter #{RPS.join(', ')}."
  end
end

def user_selection
  pick = nil
  loop do
    pick = gets.chomp
    pick = selection_expand(pick)
    break if RPS.include?(pick)
  end
  pick
end

def win(first, second)
  rps_hash = {
    'rock': ['scissors', 'lizard'],
    'paper': ['rock', 'spock'],
    'scissors': ['paper', 'lizard'],
    'lizard': ['paper', 'spock'],
    'spock': ['scissors', 'rock']
  }
  rps_hash[first.to_sym].include?(second)
end

prompt 'Let\'s play rock/paper/scissors/lizard/spock!'
comp_win_count = 0
user_win_count = 0

loop do
  prompt "Enter (r)ock, (p)aper, (s)cissors, (l)izard, or (S)pock."
  pick = user_selection

  computer_pick = RPS.sample
  prompt "Computer picks #{computer_pick}"

  if win(pick.downcase, computer_pick)
    prompt "#{pick.capitalize} beats #{computer_pick.capitalize}, you win!"
    user_win_count += 1
  elsif win(computer_pick, pick)
    prompt "#{computer_pick.capitalize} beats #{pick.capitalize}, comp wins!"
    comp_win_count += 1
  else
    prompt 'It\'s a tie'
  end

  prompt "Score: You #{user_win_count} Computer #{comp_win_count}"
  break if user_win_count == 5 || comp_win_count == 5
end

if user_win_count == 5
  prompt 'You are the grand winner, congratulations!'
else
  prompt 'Computer is the grand winner, better luck next time!'
end
