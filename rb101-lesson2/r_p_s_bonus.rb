VALID_COMPUTER_CHOICES = %w(rock paper scissors lizard spock)

VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

def prompt(message)
  puts ">> #{message}"
end

def display_result(player, computer)
  p_c = player_choice_hash(player.to_sym)
  if p_c.key?(computer.to_sym)
    prompt("It's a tie!")
  elsif p_c[player.to_sym].include?(computer)
    prompt("You won!")
  else
    prompt("Computer won!")
  end
end

def player_choice_hash(key)
  key_beats_value = {
    rock: %w(lizard scissors),
    lizard: %w(spock paper),
    spock: %w(scissors rock),
    scissors: %w(paper lizard),
    paper: %w(rock spock)
  }
  key_beats_value.slice(key)
end

def print_player_chooses
  prompt("Choose one of the following:")
  VALID_CHOICES.each { |key, value| puts"  '#{key}' for #{value}" }
end

def keep_score(player, computer, score_hash)
  p_c = player_choice_hash(player.to_sym)

  if p_c.key?(computer.to_sym)
    nil
  elsif p_c[player.to_sym].include?(computer)
    score_hash[:player] += 1
  else
    score_hash[:computer] += 1
  end

  score_hash
end

def display_score(score_hash)
  prompt("The current score is:")
  score_hash.each { |key, value| puts "  #{key.to_s.capitalize} - #{value}" }
end

def keep_playing?
  prompt("Do you want to keep playing the best of 5? ('y' to continue)")
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

score = { player: 0, computer: 0 }

# ---Begin Program---

prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock!
   The first to 5 wins.")

loop do # main loop
  player_choice = ''
  loop do
    print_player_chooses
    player_choice = gets.chomp.downcase

      if VALID_CHOICES.key?(player_choice)
        break
      else
        prompt("That's not a valid choice.")
      end
  end

  player_choice = VALID_CHOICES[player_choice]
  computer_choice = VALID_COMPUTER_CHOICES.sample

  prompt("You chose #{player_choice}; computer chose #{computer_choice}.")
  display_result(player_choice, computer_choice)

  score = keep_score(player_choice, computer_choice, score)
  display_score(score)

  if score[:player] == 5
    prompt("You are the Grand Champion!")
    break
  elsif score[:computer] == 5
    prompt("Computer is the Grand Champion!")
    break
  end
  
  break unless keep_playing?

end

prompt("Thanks for playing! Goodbye.")
