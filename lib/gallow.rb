module Gallow
  include Colorable

  def draw_gallow(pattern, guess, misses)
    <<~HEREDOC

    #{cyan(bold("+---+"))}     
    #{cyan(bold("|"))}          WORD:   #{pattern.join(' ')}
    #{cyan(bold("|"))}            
    #{cyan(bold("|"))}          GUESS:  #{guess}
    #{cyan(bold("|"))}  
    #{cyan(bold("|"))}          MISSES: #{red("#{misses.join(', ')}")}  
    #{cyan(bold("========="))}
    HEREDOC
  end
  
  def draw_head(pattern, guess, misses)
    <<~HEREDOC

    #{cyan(bold("+---+"))}     
    #{cyan(bold("|"))}          WORD:   #{pattern.join(' ')}  
    #{cyan(bold("|"))}   #{lt_yellow("0")}       
    #{cyan(bold("|"))}          GUESS:  #{guess}
    #{cyan(bold("|"))}         
    #{cyan(bold("|"))}          MISSES: #{red("#{misses.join(', ')}")}
    #{cyan(bold("========="))}
    HEREDOC
  end
  
  def draw_body(pattern, guess, misses)
    <<~HEREDOC

    #{cyan(bold("+---+"))}     
    #{cyan(bold("|"))}          WORD:   #{pattern.join(' ')}
    #{cyan(bold("|"))}   #{lt_yellow("0")}      
    #{cyan(bold("|"))}   #{lt_yellow("|")}      GUESS:  #{guess}
    #{cyan(bold("|"))}         
    #{cyan(bold("|"))}          MISSES: #{red("#{misses.join(', ')}")}
    #{cyan(bold("========="))}
    HEREDOC
  end
  
  def draw_right_arm(pattern, guess, misses)
    <<~HEREDOC

    #{cyan(bold("+---+"))}     
    #{cyan(bold("|"))}          WORD:   #{pattern.join(' ')}  
    #{cyan(bold("|"))}   #{orange("0")}      
    #{cyan(bold("|"))}   #{orange("|\\")}     GUESS:  #{guess}  
    #{cyan(bold("|"))}         
    #{cyan(bold("|"))}          MISSES: #{red("#{misses.join(', ')}")}
    #{cyan(bold("========="))}
    HEREDOC
  end
  
  def draw_left_arm(pattern, guess, misses)
    <<~HEREDOC

    #{cyan(bold("+---+"))}     
    #{cyan(bold("|"))}          WORD:   #{pattern.join(' ')}
    #{cyan(bold("|"))}   #{orange("0")}      
    #{cyan(bold("|"))}  #{orange("/|\\")}     GUESS:  #{guess}
    #{cyan(bold("|"))}      
    #{cyan(bold("|"))}          MISSES: #{red("#{misses.join(', ')}")}
    #{cyan(bold("========="))}
    HEREDOC
  end
  
  def draw_right_leg(pattern, guess, misses)
    <<~HEREDOC

    #{cyan(bold("+---+"))}     
    #{cyan(bold("|"))}          WORD:   #{pattern.join(' ')}
    #{cyan(bold("|"))}   #{lt_red("0")}      
    #{cyan(bold("|"))}  #{lt_red("/|\\")}     GUESS:  #{guess}
    #{cyan(bold("|"))}    #{lt_red("\\")}     
    #{cyan(bold("|"))}          MISSES: #{red("#{misses.join(', ')}")}
    #{cyan(bold("========="))}
    HEREDOC
  end
  
  def draw_left_leg(pattern, guess, misses)
    <<~HEREDOC
    #{cyan(bold("+---+"))}     
    #{cyan(bold("|"))}          WORD:   #{pattern.join(' ')}
    #{cyan(bold("|"))}   #{red("0")}      
    #{cyan(bold("|"))}  #{red("/|\\")}     GUESS:  #{guess}
    #{cyan(bold("|"))}  #{red("/ \\")}     
    #{cyan(bold("|"))}          MISSES: #{red("#{misses.join(', ')}")}
    #{cyan(bold("========="))}
    HEREDOC
  end
  
  def draw_noose(pattern, guess, misses)
    <<~HEREDOC

    #{cyan(bold("+---+"))}     
    #{cyan(bold("|"))}   #{red("|")}      WORD:   #{pattern.join(' ')}
    #{cyan(bold("|"))}   #{red("0")}      
    #{cyan(bold("|"))}  #{red("/|\\")}     GUESS:  #{guess}
    #{cyan(bold("|"))}  #{red("/ \\")}     
    #{cyan(bold("|"))}          MISSES: #{red("#{misses.join(', ')}")}
    #{cyan(bold("========="))}
    HEREDOC
  end
end