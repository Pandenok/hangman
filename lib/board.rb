class Board
  include Gallow
  PLACEHOLDER = ' _ '
  
  attr_accessor :pattern
  
  def initialize
    @pattern = pattern
  end
  
  def show_pattern(secret_word)
    puts "Secret word is ready to be guessed."
    @pattern = secret_word.split('').map { |letter| letter = PLACEHOLDER }.join(' ')
  end
end