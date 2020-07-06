class Guesser
  include Display

  attr_reader :guess

  def initialize; end
  
  def make_guess(input)
    input = input.downcase
    @guess = input unless valid_input?(input)
  end

  def valid_input?(input)
    until input.match?(/[a-z2]/)
      puts display_error_invalid_input
      print display_valid_input_example
      input = gets.chomp.downcase
    end
    @guess = input
  end
end