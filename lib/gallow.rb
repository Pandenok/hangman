module Gallow
  include Colorable

  def draw_gallow(pattern, guess, misses)
    <<~HEREDOC

    +---+     
    |        WORD:   #{pattern.join(' ')}
    |          
    |        GUESS:  #{guess}
    |
    |        MISSES: #{red("#{misses.join(', ')}")}  
    =========
    HEREDOC
  end
  
  def draw_head(pattern, guess, misses)
    <<~HEREDOC

    +---+     
    |         WORD:   #{pattern.join(' ')}  
    |   0       
    |         GUESS:  #{guess}
    |         
    |         MISSES: #{red("#{misses.join(', ')}")}
    =========
    HEREDOC
  end
  
  def draw_body(pattern, guess, misses)
    <<~HEREDOC

    +---+     
    |         WORD:   #{pattern.join(' ')}
    |   0       
    |   |     GUESS:  #{guess}
    |         
    |         MISSES: #{red("#{misses.join(', ')}")}
    =========
    HEREDOC
  end
  
  def draw_right_arm(pattern, guess, misses)
    <<~HEREDOC

    +---+     
    |          WORD:   #{pattern.join(' ')}  
    |   0        
    |   |\\     GUESS:  #{guess}  
    |         
    |          MISSES: #{red("#{misses.join(', ')}")}
    =========
    HEREDOC
  end
  
  def draw_left_arm(pattern, guess, misses)
    <<~HEREDOC

    +---+     
    |          WORD:   #{pattern.join(' ')}
    |   0       
    |  /|\\     GUESS:  #{guess}
    |         
    |          MISSES: #{red("#{misses.join(', ')}")}
    =========
    HEREDOC
  end
  
  def draw_right_leg(pattern, guess, misses)
    <<~HEREDOC

    +---+     
    |          WORD:   #{pattern.join(' ')}
    |   0       
    |  /|\\     GUESS:  #{guess}
    |    \\     
    |          MISSES: #{red("#{misses.join(', ')}")}
    =========
    HEREDOC
  end
  
  def draw_left_leg(pattern, guess, misses)
    <<~HEREDOC
    +---+     
    |          WORD:   #{pattern.join(' ')}
    |   0       
    |  /|\\     GUESS:  #{guess}
    |  / \\     
    |          MISSES: #{red("#{misses.join(', ')}")}
    =========
    HEREDOC
  end
  
  def draw_noose(pattern, guess, misses)
    <<~HEREDOC
    
    +---+     
    |   |      WORD:   #{pattern.join(' ')}
    |   0      
    |  /|\\     GUESS:  #{guess}
    |  / \\     
    |          MISSES: #{red("#{misses.join(', ')}")}
    =========
    HEREDOC
  end
end