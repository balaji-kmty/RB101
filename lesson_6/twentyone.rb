# Twenty-one (simplified blackjack)

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  dk = []
  values = ['2', '3', '4', '5', '6', '7', '8', '9', '10',
            'Jack', 'Queen', 'King', 'Ace']
  suits = ['spades', 'clubs', 'diamonds', 'hearts']
  suits.each do |suit|
    values.each do |value|
      dk << [suit, value]
    end
  end
  dk
end

def hit!(dk, cards)
  cards << dk.slice!(rand(dk.length - 1))
end

def deal_cards!(dk)
  plyr_cards = []
  dlr_cards = []
  2.times do
    hit!(dk, plyr_cards)
    hit!(dk, dlr_cards)
  end
  return plyr_cards, dlr_cards
end

# rubocop:disable Metrics/AbcSize
def display_cards(plyr_cards, dlr_cards, turn = 'player')
  system 'clear'
  if turn == 'player'
    prompt "Player's turn..."
    prompt "Dealer's cards are: "
    prompt "?? and #{dlr_cards[1][1]} of #{dlr_cards[1][0]}"
  else
    prompt "Dealer's turn..."
    prompt "Dealer's cards are: "
    dlr_cards.each { |dlr_card| prompt "#{dlr_card[1]} of #{dlr_card[0]}" }
  end
  prompt "Player's cards are: "
  plyr_cards.each { |plyr_card| prompt "#{plyr_card[1]} of #{plyr_card[0]}" }
end
# rubocop:enable Metrics/AbcSize

def cards_total(cards)
  values = cards.map { |card| card[1] }
  total = 0
  values.each do |value|
    total += if %w(Jack Queen King).include?(value)
               10
             elsif value == 'Ace'
               11
             else
               value.to_i
             end
  end

  # correct Ace value if necessary
  values.select { |value| value == 'Ace' }.count.times do
    total -= 10 if total > 21
  end
  total
end

prompt "Welcome to 21. Starting game now..."

loop do
  # initialize deck, deal first hand and display player sum.

  deck = initialize_deck
  player_cards, dealer_cards = deal_cards!(deck)
  display_cards(player_cards, dealer_cards)
  player_total = cards_total(player_cards)
  dealer_total = cards_total(dealer_cards)
  prompt "Player cards sum: #{player_total}"
  hit_stay = ''
  play_again = ''

  # player turn logic
  loop do
    prompt "(h)it or (s)tay?"
    hit_stay = gets.chomp.downcase
    if hit_stay == 'h'
      hit!(deck, player_cards)
      display_cards(player_cards, dealer_cards)
      player_total = cards_total(player_cards)
      prompt " Card total is #{player_total}"
      break if cards_total(player_cards) > 21
    elsif hit_stay == 's'
      break
    else
      prompt "Invalid input."
    end
  end

  # dealer turn logic
  if player_total > 21
    prompt "You bust, dealer wins."
  else
    loop do
      player_total = cards_total(player_cards)
      dealer_total = cards_total(dealer_cards)
      display_cards(player_cards, dealer_cards, 'dealer')
      prompt "Dealer: #{dealer_total} Player: #{player_total}"
      break if dealer_total >= 17 || dealer_total > 21
      prompt "Dealer hits..."
      sleep(2)
      hit!(deck, dealer_cards)
    end

    # win logic
    if player_total > dealer_total
      prompt "Player wins!"
    elsif player_total == dealer_total
      prompt "It's a tie"
    elsif dealer_total > 21
      prompt "Dealer busts, player wins!"
    else
      prompt "Dealer wins."
    end
  end

  # play again?
  loop do
    prompt "Play again? (y)es or (n)o"
    play_again = gets.chomp.downcase
    if play_again == 'y' || play_again == 'n'
      break
    else
      prompt "Invalid input."
    end
  end

  break if play_again == 'n'
end
