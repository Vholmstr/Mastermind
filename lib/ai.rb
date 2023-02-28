class Computer
  def initialize
    @next_guess = [1, 1, 1, 1]
    @saved_numbers = []
    @strategy_step = 1
  end

  # Guess code
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
    # If the saved numbers array is full
    if @saved_numbers.length > 3 
      @strategy_step = 2
    elsif feedback == ''
      return
    # Else, split the array into Os and add the guessnumber
    else
      feedback.length.times { @saved_numbers.push(guess.to_i.digits[0]) }
    end
  end
end