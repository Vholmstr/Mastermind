class Computer
  def initialize
    @next_guess = [1, 1, 1, 1]
    @saved_numbers = []
    @strategy_step = 1
  end

  # Guess code depending on which step of the strategy
  def computer_guess(turn)
    guess = [0, 0, 0, 0]
    case @strategy_step
    when 1
      guess.map! { turn }
      return guess.join
    when 2
      @saved_numbers.shuffle!
      return @saved_numbers.join
    end
  end

  def analyze_feedback(feedback, guess)
    # If already at the following strategy step
    if @strategy_step == 2 || feedback == ''
      return
    end
    # Else, split the array into Os and add as many of the guessed numbers
    feedback.length.times { @saved_numbers.push(guess.to_i.digits[0]) }

    if @saved_numbers.length >= 4
      @strategy_step = 2
    end
  end
end