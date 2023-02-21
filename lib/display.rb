class Display
  def prompt(message)
    puts message
    gets.chomp!
  end

  def new_game
    puts 'New game started.'
    puts 'In this version of mastermind the numbers are assigned to colors, guess the code using numbers'
    puts 'You have 12 turns to guess the code, will recieve feedback on your guesses:'
    puts '   An O means that your guess has a number in the correct position'
    puts '   An X means that the code contains one of the numbers, but not in the guessed position/n'
    puts ''
  end

  def player_guess(turn)
    puts "Turn: #{turn}"
    puts ''
    guess = prompt('Guess the four number combination, or type exit to quit')
    if guess.length == 4
      guess
    elsif guess == 'exit'
      guess
    else
      nil
    end
  end

  def print_guess(guess, color_vals_array)
    print_string = ''
    color_vals_array.each_with_index { |val, i| print_string << "\033[1;#{val}m #{guess[i]} \033[0m" }
    puts print_string
  end

  def faulty_input
    puts 'Not a valid input, remember to only write four numbers corresponding to the colors in the code'
  end

  def guess_feedback(feedback_str)
    puts "Feedback: #{feedback_str}"
    puts ''
  end
end
