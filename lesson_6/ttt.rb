# tic tac toe
require 'pry'

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

# prompt user for input
def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{empty_squares?(brd).join(',')}): "
    square = gets.chomp.to_i
    break if empty_squares?(brd).include?(square)
    prompt "Invalid choice"
  end
  brd[square] = PLAYER_MARKER
end

# computer places piece
def computer_places_piece!(brd)
  square = empty_squares?(brd).sample
  brd[square] = COMPUTER_MARKER
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

loop do
  board = initialize_board
  display_board(board)

  loop do
    player_places_piece!(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
  end

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "Board is full, it's a tie."
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
