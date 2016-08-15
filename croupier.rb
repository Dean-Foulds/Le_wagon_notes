require_relative 'black_jack'

def state_of_the_game(player_score, bank_score)
  return "Your score is #{player_score}, bank is #{bank_score}"
end

def end_game_message(player_score, bank_score)
  if player_score > 21
    return "lose"
  elsif player_score == 21
    return "black jack"
  elsif player_score > bank_score
    return "win"
  elsif player_score < bank_score
    return "lose"
  end
end


def play_game
  answer = ""
  until answer == "no" || player > 21 || player == 21
    puts state_of_the_game(pick_player_card, pick_bank_score)
    puts "Card? (type 'y' or 'yes' for a new card)"
    answer = gets.chomp
    player = pick_player_card + player if answer == "y" || answer == "yes"
  end
  puts end_game_message(player, bank)
end
