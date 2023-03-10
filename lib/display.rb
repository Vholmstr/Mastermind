class Display
  def prompt(message)
    puts message
    gets.chomp!
  end

  def new_game
    puts 'New game started.'
    puts 'In this version of mastermind the code consists of four numbers between 1-6, duplicates are allowed'
    puts 'You have 12 turns to guess the four digit code, you will recieve feedback on your guesses:'
    puts '   Each O means that your guess has a number in the correct position'
    puts '   Each X means that the code contains one of the guessed numbers, but not in the guessed position'
    puts ''
  end

  def player_guess(turn)
    puts "Turn: #{turn}"
    puts ''
    valid_guess = false
    guess = ''
    until valid_guess
      guess = prompt('Guess the four number combination, or type exit to quit')
      if valid_input?(guess)
        valid_guess = true
      elsif guess == 'exit'
        valid_guess = true
      else
        faulty_input
      end
    end
    guess
  end

  def computer_guess(turn)
    puts "Turn: #{turn}"
    puts ''
    puts 'Computer guesses:'
  end

  def input_manual_code
    valid_code = false
    puts 'Create a four digit code consisting of numbers from 1-6 for the computer to guess'
    until valid_code
      code = prompt('Input the four number code, or type exit to quit')
      if valid_input?(code)
        valid_code = true
      elsif code == 'exit'
        valid_code = true
      else
        faulty_input
      end
    end
    code
  end

  def print_guess(guess, color_vals_array)
    print_string = ''
    color_vals_array.each_with_index { |val, i| print_string << " \033[1;#{val}m #{guess[i]} \033[0m" }
    puts print_string
  end

  def faulty_input
    puts 'Not a valid input, remember to only write four numbers from 1-6'
    puts 'Try again.'
  end

  def guess_feedback(feedback_str)
    puts "Feedback: #{feedback_str}"
    puts ''
  end

  def valid_input?(guess)
    arr = guess.to_i.digits
    if arr.length == 4
      arr.all? { |num| num <= 6 && num >= 1}
    else
      false
    end
  end
end
