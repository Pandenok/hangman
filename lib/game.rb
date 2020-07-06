require './gallow'
require './display'
require './colorable'
require 'yaml'

class Game
  include Gallow
  include Display
  include Colorable

  attr_reader :host, :board, :guesser

  MAX_ATTEMPTS = 7 

  def initialize
    puts "Game initialized."
    @host = Host.new
    @board = Board.new
    @guesser = Guesser.new
    main_menu
  end

  def main_menu
    print display_main_menu
    continue = true
    input = gets.chomp.to_i
    until input.between?(1, 3)
      puts display_error_invalid_input
      input = gets.chomp.to_i
    end
    main_menu_options(input)
  end

  def main_menu_options(input)
    case input
    when 1
      host_actions
      puts board.hide(host.secret_word).join(' ')
      play
    when 2
      load_game.play
    when 3
      menu_quit
    end
  end

  def host_actions #preparations
    host.load_library
    host.choose_word
  end

  def menu_quit
    continue = false
  end

  def play
    puts "Ready to play!"
    until game_over? do
      print display_guess_prompt
      @player_input = gets.chomp
      play_round(@player_input) unless request_save_game?(@player_input)
      break if board.word_guessed?(host.secret_word, guesser.guess)
    end
    repeat_game
  end

  def request_save_game?(input)
    save_game if input.to_i.eql?(2)
  end

  def play_round(input)
    guesser.make_guess(input)
    board.analyse_guess(host.secret_word, guesser.guess)
    puts board.draw(board.misses.size, guesser.guess)
  end

  def game_over?
    board.misses.size.eql?(MAX_ATTEMPTS)
    # puts "Game Over! Play again?"
  end

  def to_yaml
    YAML::dump(self)
  end

  def from_yaml(game)
    game_file = YAML.load(File.read(game))
    # p game_file
    # board = game_file[:board]
    # secret_word = game_file[:secret_word]
    # guesser = game_file[:guesser]
  end

  def save_game
    puts "Game saved"
    File.open("./my_game/game.yaml", 'w') { |file| file << to_yaml }
  end

  def load_game
    from_yaml("./my_game/game.yaml")
  end

  def repeat_game
    puts "One more round?"
    # print display_play_again
    input = gets.chomp
    input.downcase.eql?('y') ? Game.new : (puts "Goodbye!")
  end

end