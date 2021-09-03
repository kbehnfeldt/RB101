require 'pry-byebug'

DECK = ['2', '3', '4', '5',
        '6', '7', '8', '9',
        'Jack', 'Queen', 'King', 'Ace']

def prompt(msg)
  puts "=> #{msg}"
end

def deal!(current_hand, delt_cards)
  current_card = nil
  loop do
    current_card = DECK.sample
    break unless more_than_four?(current_card, delt_cards)
  end
  current_hand << current_card
  delt_cards << current_card
end

def more_than_four?(current_card, delt_cards)
  delt_cards.count(current_card) > 3
end

def initial_deal(player_hand, dealer_hand, delt_cards)
  2.times { deal!(player_hand, delt_cards) }
  2.times { deal!(dealer_hand, delt_cards) }
end

def display_cards(player_hand, dealer_hand, show_dealer_card=false)
  sleep(1)
  prompt "Dealer has: #{format_dealer(dealer_hand, show_dealer_card)}"
  sleep(1.5)
  prompt "You have: #{format_player(player_hand)}"
end

def display_dealer(dealer_hand, show_dealer_card=false)
  sleep(1)
  prompt "Dealer has: #{format_dealer(dealer_hand, show_dealer_card)}"
  sleep(1)
end

def format_dealer(dealer_hand, show_dealer_card, word='and')
  dealer_hand = dealer_hand.dup
  if dealer_hand.size == 2 && show_dealer_card == true
    "#{dealer_hand.first} #{word} #{dealer_hand.last}"
  elsif dealer_hand.size == 2
    "#{dealer_hand[0]} and unknown card"
  else
    dealer_hand[-1] = "#{word} #{dealer_hand.last}"
    dealer_hand.join(', ')
  end
end

def format_player(player_hand, word='and')
  player_hand = player_hand.dup
  if player_hand.size == 2
    "#{player_hand.first} #{word} #{player_hand.last}"
  else
    player_hand[-1] = "#{word} #{player_hand.last}"
    player_hand.join(', ')
  end
end

def hit?
  prompt "Would you like to 'hit' or 'stay'?"
  answer = gets.chomp.downcase
  answer.start_with?('h')
end

def calculate_total(current_hand)
  total = count_cards(current_hand)

  if total > 21
    calculate_aces(current_hand, total)
  else
    total
  end
end

def count_cards(current_hand)
  total = 0

  current_hand.each do |card|
    if card == card.to_i.to_s
      total += card.to_i
    elsif card.start_with?('A')
      total += 11
    else
      total += 10
    end
  end

  total
end

def calculate_aces(current_hand, total)
  aces = current_hand.count('Ace')

  until total <= 21 || aces <= 0
    total -= 10
    aces -= 1
  end
  total
end

def bust?(total)
  total > 21
end

def player_turn(player_hand, dealer_hand, delt_cards)
  loop do
    display_cards(player_hand, dealer_hand)

    if hit?
      deal!(player_hand, delt_cards)
    else
      break
    end

    break if bust?(calculate_total(player_hand))
  end
end

def dealer_turn(dealer_hand, delt_cards, reveal_card)
  loop do
    if calculate_total(dealer_hand) < 17
      display_dealer(dealer_hand, reveal_card)
      deal!(dealer_hand, delt_cards)
    elsif calculate_total(dealer_hand) >= 17
      break
    end

    break if bust?(calculate_total(dealer_hand))
  end
end

def calculate_winner(player_hand, dealer_hand)
  winner = String.new
  comparison = calculate_total(player_hand) <=> calculate_total(dealer_hand)

  if bust?(calculate_total(player_hand))
    winner = "Dealer"
  elsif bust?(calculate_total(dealer_hand))
    winner = "You"
  elsif comparison == 1
    winner = "You"
  elsif comparison == -1
    winner = "Dealer"
  else
    winner = "Tie"
  end

  winner
end

def display_if_bust(player_hand, dealer_hand)
  if bust?(calculate_total(player_hand))
    prompt "You busted."
  elsif bust?(calculate_total(dealer_hand))
    prompt "Dealer busted."
  end
end

def display_winner(player_hand, dealer_hand)
  winner = calculate_winner(player_hand, dealer_hand)

  if winner == "Tie"
    prompt "It's a tie!"
  elsif winner == "You"
    prompt "#{winner} win!"
  else
    prompt "#{winner} wins!"
  end
end

def play_again?
  sleep(2)
  prompt "Would you like to play again? ('y' or 'n')"
  answer = gets.chomp.downcase

  if answer.start_with?('y')
    true
  else
    false
  end
end

def dealer_deals
  prompt "The Dealer is dealing the cards..."
  sleep(2)
end

# Begin Program
prompt "Welcome to 21!"

loop do
  delt_cards = Array.new
  player_hand = Array.new
  dealer_hand = Array.new

  dealer_deals
  initial_deal(player_hand, dealer_hand, delt_cards)

  player_turn(player_hand, dealer_hand, delt_cards)
  reveal_card = true

  unless bust?(calculate_total(player_hand))
    dealer_turn(dealer_hand, delt_cards, reveal_card)
  end

  display_cards(player_hand, dealer_hand, reveal_card)
  sleep(1)
  display_if_bust(player_hand, dealer_hand)
  display_winner(player_hand, dealer_hand)

  break unless play_again?
  system 'clear'
end

prompt "Thanks for playing 21!"
