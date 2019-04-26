RPS = ['rock', 'paper', 'scissors', 'lizard', 'spock']

def prompt(message)
  puts "=> #{message}"
end

def selection_expand(pick)
  selection = { 'rock': ['r', 'rock'], 'paper': ['p', 'paper'],
                'scissors': ['s', 'scissors'], 'lizard': ['l', 'lizard'],
                'spock': ['k', 'spock'] }
  pick_expanded = nil
  selection.each do |key, value|
    pick_expanded = key.to_s if value.include?(pick)
  end
  if pick_expanded
    return pick_expanded
  else
    prompt "Invalid selection."\
      " Enter (r)ock, (p)aper, (s)cissors, (l)izard, or spoc(k)."
  end
end

def user_selection
  pick = nil
  loop do
    pick = gets.chomp.downcase
    pick = selection_expand(pick)
    break if RPS.include?(pick)
  end
  pick
end

def win?(first, second)
  win_logic = {
    'rock': ['scissors', 'lizard'],
    'paper': ['rock', 'spock'],
    'scissors': ['paper', 'lizard'],
    'lizard': ['paper', 'spock'],
    'spock': ['scissors', 'rock']
  }
  win_logic[first.to_sym].include?(second)
end

prompt 'Let\'s play rock/paper/scissors/lizard/spock!'
computer_win_count = 0
user_win_count = 0
win_count = 5

loop do
  prompt "Enter (r)ock, (p)aper, (s)cissors, (l)izard, or spoc(k)."
  pick = user_selection

  computer_pick = RPS.sample
  prompt "Computer picks #{computer_pick}"

  if win?(pick.downcase, computer_pick)
    prompt "#{pick.capitalize} beats #{computer_pick.capitalize}, you win!"
    user_win_count += 1
  elsif win?(computer_pick, pick)
    prompt "#{computer_pick.capitalize} beats #{pick.capitalize},"\
      " computer wins!"
    computer_win_count += 1
  else
    prompt 'It\'s a tie'
  end

  prompt "Score: You #{user_win_count} Computer #{computer_win_count}"
  break if user_win_count == win_count || computer_win_count == win_count
end

if user_win_count == win_count
  prompt 'You are the grand winner, congratulations!'
else
  prompt 'Computer is the grand winner, better luck next time!'
end
