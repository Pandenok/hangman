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
    @host = Host.new
    @board = Board.new
    @guesser = Guesser.new
    main_menu
  end

  def main_menu
    print display_main_menu
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
      play_game_menu
    when 2
      load_game_menu
    when 3
      menu_quit
    end
  end

  def play_game_menu
    setup_game_components
    play
  end

  def load_game_menu
    print display_game_loading
    load_game.play
  end

  def setup_game_components
    host.load_library
    host.choose_word
    board.hide(host.secret_word).join(' ')
  end

  def setup_input_interface
    puts display_game_shortcuts
    puts display_game_start
    puts board.draw(board.misses.size, guesser.guess)
  end

  def menu_quit
    puts display_closing_greeting
    exit
  end

  def play
    setup_input_interface
    until game_over?
      print display_guess_prompt
      @player_input = gets.chomp
      play_round(@player_input) unless restrictions?(@player_input)
      break if board.word_guessed?(host.secret_word, guesser.guess)
    end
    game_finished
    repeat_game
  end

  def restrictions?(input)
    request_save_game?(input) ||
      pause_game?(input) ||
      board.letter_already_tried?(input)
  end

  def request_save_game?(input)
    save_game if input.to_i.eql?(2)
  end

  def pause_game?(input)
    main_menu if input.to_i.eql?(5)
  end
  
  def play_round(input)
    guesser.make_guess(input)
    board.analyse_guess(host.secret_word, guesser.guess)
    puts board.draw(board.misses.size, guesser.guess)
  end

  def game_over?
    board.misses.size.eql?(MAX_ATTEMPTS)
  end

  def to_yaml
    YAML::dump(self)
  end

  def from_yaml(game)
    YAML.load(File.read(game))
  end

  def save_game
    puts display_report_game_saved
    File.open('./my_game/game.yaml', 'w') { |file| file << to_yaml }
  end

  def load_game
    from_yaml('./my_game/game.yaml')
  end

  def game_finished
    game_over? ? (puts display_game_over(host.secret_word)) : (puts display_congratulations)
  end

  def repeat_game
    print display_play_again
    input = gets.chomp
    input.downcase.eql?('y') ? Game.new : (puts display_farewell)
  end
end
