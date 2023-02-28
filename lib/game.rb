require_relative 'code'
require_relative 'display'
require_relative 'ai'

class Game 
  def initialize
    @code = Code.new
    @display = Display.new
    @turn = 1
    @game_ongoing = true
  end

  def new_codebreaker_game
    @turn = 1
    @code.random_code
    @game_ongoing = true
    @display.new_game
    while @game_ongoing
      if @turn <= 12
        round
        @turn += 1
      else
        @game_ongoing = false
      end
    end
    puts 'Thank you for playing!'
  end

  def new_codemaker_game
    @ai = Computer.new
    @turn = 1
    @game_ongoing = true
    code = @display.input_manual_code
    
    if code == 'exit'
      @game_ongoing = false
    end
    @code.manual_code(code)
    
    while @game_ongoing
      guess = @ai.computer_guess(@turn)
      @code.update_color_code(guess)
      @display.computer_guess(@turn)
      @display.print_guess(@code.handle_guess_str(guess), @code.color_code)
      result = @code.guess_code(guess)
      if result == 'OOOO'
        puts 'The computer has cracked the code! Better luck next time!'
        @game_ongoing = false
      else
        @display.guess_feedback(result)
        @ai.analyze_feedback(result, guess)
      end
      @turn += 1
      if @turn > 12
        @game_ongoing = false
      end
      sleep(0.5)
    end

    puts "Thank you for playing"
  end

  def round
    guess = @display.player_guess(@turn)
    if guess == "exit"
      @game_ongoing = false
    else
      @code.update_color_code(guess)
      @display.print_guess(@code.handle_guess_str(guess), @code.color_code)
      result = @code.guess_code(guess)
      if result == 'OOOO'
        puts 'Congratulations, you win! You cracked the code!'
        @game_ongoing = false
      else
        @display.guess_feedback(result)
      end
    end
  end

  def computer_round
    
  end
end
