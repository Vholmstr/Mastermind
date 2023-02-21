require_relative 'code'
require_relative 'display'

class Game 
  def initialize
    @code = Code.new
    @display = Display.new
    @turn = 0
    @game_ongoing = true
  end

  def new_game
    @turn = 0
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
end
