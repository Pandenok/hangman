class Guesser
  attr_reader :guess

  def initialize; end
  
  def make_guess
    print "Make guess: "
    @player_input = gets.chomp.downcase
    valid_input?(@player_input)
    @guess = @player_input
  end

  def valid_input?(player_input)
    until player_input.match?(/[a-z]/)
      puts "Invalid input"
      puts "Please type one letter of the latin alphabet"
      player_input = gets.chomp.downcase
    end
  end
end