require './gallow'

class Game
  include Gallow

  MAX_ATTEMPTS = 7 

  def initialize
    puts "Game initialized."
    host = Host.new
    board = Board.new
    guesser = Guesser.new
    play(host, board, guesser)
  end

  def play(host, board, guesser)
    puts "Ready to play!"
    host.load_library
    host.choose_word
    puts "You secret word looks like this: " + board.hide(host.secret_word).join(' ')
    until game_over?(board) do
      guesser.make_guess
      board.analyse_guess(host.secret_word, guesser.guess)
      puts board.draw(board.misses.size, guesser.guess)
      break if board.word_guessed?(host.secret_word, guesser.guess)
    end
    repeat_game
  end

  def game_over?(board)
    board.misses.size.eql?(MAX_ATTEMPTS)
    # puts "Game Over! Play again?"
  end

  def repeat_game
    puts "One more round?"
    # print display_play_again
    input = gets.chomp
    input.downcase.eql?('y') ? Game.new : (puts "Goodbye!")
  end

end