class Guesser
  include Display

  attr_reader :guess

  def initialize
    @guess = guess
  end
  
  def make_guess(input)
    input = input.upcase
    @guess = input unless valid_input?(input)
  end

  def valid_input?(input)
    until input.match?(/[A-Z25]/)
      puts display_error_invalid_input
      print display_valid_input_example
      input = gets.chomp.upcase
    end
    @guess = input
  end
end