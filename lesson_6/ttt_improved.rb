# tic tac toe with improvements in computer play strategy
require 'pry'

TURN = 'choose'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                        [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

def prompt(message)
  puts "=> #{message}"
end

# initialize and display board
# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----|-----|-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares?(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimit = ', ', conj = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{conj} ")
  else
    "#{arr.first(arr.size - 1).join(delimit)} #{conj} #{arr.last}"
  end
end

# prompt user for input
def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares?(brd))}): "
    square = gets.chomp.to_i
    break if empty_squares?(brd).include?(square)
    prompt "Invalid choice"
  end
  brd[square] = PLAYER_MARKER
end

# defensive AI
def win_next_move(brd, marker)
  WINNING_COMBINATIONS.each do |combination|
    if brd.values_at(*combination).count(marker) == 2 &&
       brd.values_at(*combination).count(INITIAL_MARKER) == 1
      temp_hsh = {}
      combination.each { |key| temp_hsh[key] = brd.values_at(key)[0] }
      return temp_hsh.key(INITIAL_MARKER)
    end
  end
  nil
end

def win_likely?(brd, marker)
  !!win_next_move(brd, marker)
end

# computer places piece
def computer_places_piece!(brd)
  if win_likely?(brd, COMPUTER_MARKER)
    square = win_next_move(brd, COMPUTER_MARKER)
    brd[square] = COMPUTER_MARKER
  elsif win_likely?(brd, PLAYER_MARKER)
    square = win_next_move(brd, PLAYER_MARKER)
    brd[square] = COMPUTER_MARKER
  elsif empty_squares?(brd).include?(5)
    brd[5] = COMPUTER_MARKER
  else
    square = empty_squares?(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def place_piece!(brd, player)
  if player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(player)
  player == 'player' ? 'computer' : 'player'
end

# end game conditions
def detect_winner(brd)
  WINNING_COMBINATIONS.each do |combination|
    if brd.values_at(*combination).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*combination).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def board_full?(brd)
  empty_squares?(brd) == []
end

player_wins = 0
computer_wins = 0

loop do
  board = initialize_board

  current_player = case TURN
  when 'choose'
    prompt "Who goes first? Enter 'player' or 'computer'"
    input = ''
    loop do
      input = gets.chomp.downcase
      if input == 'player' || input == 'computer'
        break
      else
        prompt "Invalid input, enter 'player' or 'computer'"
      end
    end
    input
  else TURN
  end

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    if detect_winner(board) == 'Player'
      player_wins += 1
    else
      computer_wins += 1
    end
  else
    prompt "Board is full, it's a tie."
  end

  if player_wins == 5
    prompt "You are the grand winner! Good bye."
    break
  elsif computer_wins == 5
    prompt "Computer is the grand winner! Good bye."
    break
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

# further ideas:
# Minimax algorithm
#
# You can build an unbeatable Tic Tac Toe by utilizing the minimax algorithm.
#
# Bigger board
#
# What happens if the board is 5x5 instead of 3x3? What about a 9x9 board?
#
# More players
# 
# When you have a bigger board, you can perhaps add more than 2 players. Would it be interesting to play against 2 computers? What about 2 human players against a computer?
