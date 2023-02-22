class Code
  attr_reader :code, :color_code

  COLORS = [41, 42, 43, 44, 45, 46].freeze

  def initialize
    @code = [1, 2, 3, 4]
    @color_code = [41, 41, 41, 41]
  end

  # When computer chooses a code
  def random_code
    @code.map! { Random.rand(1..6) }
  end

  # When player chooses a code
  def manual_code(code_str)
    code_arr = handle_guess_str(code_str)
    @code = code_arr
  end

  def guess_code(guess)
    guess_array = handle_guess_str(guess)
    ret_string = ''
    check_pos_and_num(guess_array).times { ret_string << 'O' }
    check_num(guess_array).times { ret_string << 'X' }
    ret_string
  end

  # Checks how many of the numbers are in the correct position
  def check_pos_and_num(guess_array)
    correct_pos_and_num = 0
    guess_array.each_with_index do |val, i|
      if val == @code[i]
        correct_pos_and_num += 1
      end
    end
    correct_pos_and_num
  end

  def check_num(guess_array)
    # Check if the same numbers exist in both arrays but not at the same place

    # Remove numbers that are in the correct positions
    modified_code = []
    # Change the numbers to nil in modified code and 7 in guess array so they don't
    # count in the next step
    4.times do |i|
      if guess_array[i] == @code[i]
        guess_array[i] = 7
        modified_code.push(8)
      else
        modified_code.push(@code[i])
      end
    end

    # Add to count if the number exists in both arrays and then change
    # the value to nil so it doesn't count twice
    count = 0
    guess_array.each do |val|
      4.times do |i|
        if val == modified_code[i]
          count += 1
          modified_code[i] = nil
          break
        end
      end
    end
    count
  end

  # Changes the string to an Array of integers, and reverses them because .digits putse them in a reversed order
  def handle_guess_str(guess_str)
    guess_str.to_i.digits.reverse
  end

  def update_color_code(guess)
    code = handle_guess_str(guess)
    code.each_with_index { |num, i| @color_code[i] = COLORS[num - 1] }
  end
end
