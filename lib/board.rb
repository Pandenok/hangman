require './colorable'

class Board
  include Gallow
  include Display
  include Colorable

  PLACEHOLDER = " _ "
  
  attr_accessor :pattern, :misses
  
  def initialize
    @pattern = pattern
    @misses = []
  end
  
  def hide(secret_word)
    @pattern = secret_word.split('').map { |letter| letter = bg_gray("#{PLACEHOLDER}") }
  end

  def letter_guessed?(secret_word, guess)
    secret_word.split('').include?(guess)
  end

  def word_guessed?(secret_word, guess)
    guess.eql?(secret_word)
  end
  
  def unhide_right_guess(secret_word, guess, pattern)
    secret_word.split('').each_with_index do |letter, idx|
      if letter.eql?(guess)
        letter = green(underline("#{letter}"))
        pattern[idx] = letter 
      end
    end
  end

  def unhide_secret_word(secret_word, guess, pattern)
    @pattern = secret_word.split('').map { |letter| green(underline("#{letter}")) }
  end

  def analyse_guess(secret_word, guess)
    if letter_guessed?(secret_word, guess)
      unhide_right_guess(secret_word, guess, pattern)
    elsif word_guessed?(secret_word, guess)
      unhide_secret_word(secret_word, guess, pattern) 
    else
      misses << guess
    end
  end

  def draw(number, guess)
    {
      0 => draw_gallow(pattern, guess, misses),
      1 => draw_head(pattern, guess, misses),
      2 => draw_body(pattern, guess, misses),
      3 => draw_right_arm(pattern, guess, misses),
      4 => draw_left_arm(pattern, guess, misses),
      5 => draw_right_leg(pattern, guess, misses),
      6 => draw_left_leg(pattern, guess, misses),
      7 => draw_noose(pattern, guess, misses),
    } [number]
  end

end