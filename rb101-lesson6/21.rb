# 21

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

def display_cards(player_hand, dealer_hand, player_total, dealer_total,
                  show_dealer_card=false)
  puts "-----------------"
  sleep(1)
  if show_dealer_card
    prompt "Dealer has: #{format_dealer(dealer_hand, show_dealer_card)}
            totaling #{dealer_total}."
  else
    prompt "Dealer has: #{format_dealer(dealer_hand, show_dealer_card)}."
  end
  prompt "You have: #{format_player(player_hand)} totaling #{player_total}"
end

def display_dealer(dealer_hand, dealer_total, show_dealer_card=false)
  puts "-----------------"
  sleep(1)
  prompt "Dealer has: #{format_dealer(dealer_hand, show_dealer_card)}
          totaling #{dealer_total}"
  sleep(1)
end

def format_dealer(dealer_hand, show_dealer_card, word='and')
  dealer_hand = dealer_hand.dup
  if dealer_hand.size == 2 && show_dealer_card == true
    "#{dealer_hand.first} #{word} #{dealer_hand.last}"
  elsif dealer_hand.size == 2
    "#{dealer_hand[0]} and hole card"
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

def calculate_winner(player_total, dealer_total)
  winner = String.new
  comparison = player_total <=> dealer_total

  if bust?(player_total)
    winner = "Dealer"
  elsif bust?(dealer_total)
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

def display_if_bust(player_total, dealer_total)
  if bust?(player_total)
    prompt "You busted."
  elsif bust?(dealer_total)
    prompt "Dealer busted."
  end
end

def display_winner(player_total, dealer_total)
  winner = calculate_winner(player_total, dealer_total)

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
  player_total = calculate_total(player_hand)
  dealer_total = calculate_total(dealer_hand)

  # player_turn
  loop do
    display_cards(player_hand, dealer_hand, player_total, dealer_total)

    if hit?
      deal!(player_hand, delt_cards)
      player_total = calculate_total(player_hand)
    else
      break
    end

    break if bust?(player_total)
  end

  reveal_card = true

  # dealer Turn
  unless bust?(player_total)
    loop do
      if dealer_total < 17
        display_dealer(dealer_hand, dealer_total, reveal_card)
        deal!(dealer_hand, delt_cards)
        dealer_total = calculate_total(dealer_hand)
      elsif dealer_total >= 17
        break
      end

      break if bust?(dealer_total)
    end
  end

  if bust?(dealer_total)
    display_dealer(dealer_hand, dealer_total, reveal_card)
  else
    display_cards(player_hand, dealer_hand, player_total, dealer_total,
                  reveal_card)
  end
  sleep(1)
  display_if_bust(player_total, dealer_total)
  display_winner(player_total, dealer_total)

  break unless play_again?
  system 'clear'
end

prompt "Thanks for playing 21!"
