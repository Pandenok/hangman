module Gallow
  def draw_gallow(pattern, guess, misses)
    <<~HEREDOC
    +---+     
    |        WORD:   #{pattern.join(' ').upcase}
    |          
    |        GUESS:  #{guess.upcase}
    |
    |        MISSES: #{misses.join(', ').upcase}  
    =========
    HEREDOC
  end
  
  def draw_head(pattern, guess, misses)
    <<~HEREDOC
    +---+     
    |         WORD:   #{pattern.join(' ').upcase}  
    |   0       
    |         GUESS:  #{guess.upcase}
    |         
    |         MISSES: #{misses.join(', ').upcase}
    =========
    HEREDOC
  end
  
  def draw_body(pattern, guess, misses)
    <<~HEREDOC
    +---+     
    |         WORD:   #{pattern.join(' ').upcase}
    |   0       
    |   |     GUESS:  #{guess.upcase}
    |         
    |         MISSES: #{misses.join(', ').upcase}
    =========
    HEREDOC
  end
  
  def draw_right_arm(pattern, guess, misses)
    <<~HEREDOC
    +---+     
    |          WORD:   #{pattern.join(' ').upcase}  
    |   0        
    |   |\\   GUESS:  #{guess.upcase}  
    |         
    |          MISSES: #{misses.join(', ').upcase}
    =========
    HEREDOC
  end
  
  def draw_left_arm(pattern, guess, misses)
    <<~HEREDOC
    +---+     
    |          WORD:   #{pattern.join(' ').upcase}
    |   0       
    |  /|\\   GUESS:  #{guess.upcase}
    |         
    |          MISSES: #{misses.join(', ').upcase}
    =========
    HEREDOC
  end
  
  def draw_right_leg(pattern, guess, misses)
    <<~HEREDOC
    +---+     
    |          WORD:   #{pattern.join(' ').upcase}
    |   0       
    |  /|\\   GUESS:  #{guess.upcase}
    |    \\     
    |          MISSES: #{misses.join(', ').upcase}
    =========
    HEREDOC
  end
  
  def draw_left_leg(pattern, guess, misses)
    <<~HEREDOC
    +---+     
    |          WORD:   #{pattern.join(' ').upcase}
    |   0       
    |  /|\\   GUESS:  #{guess.upcase}
    |  / \\     
    |          MISSES: #{misses.join(', ').upcase}
    =========
    HEREDOC
  end
  
  def draw_noose(pattern, guess, misses)
    <<~HEREDOC
    +---+     
    |   |      WORD:   #{pattern.join(' ').upcase}
    |   0      
    |  /|\\   GUESS:  #{guess.upcase}
    |  / \\     
    |          MISSES: #{misses.join(', ').upcase}
    =========
    HEREDOC
  end
end