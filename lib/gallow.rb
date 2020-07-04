module Gallow
  def initial_setup(secret_word, guess)
    <<~HEREDOC
    +---+     
    |        WORD:  #{secret_word}
    |          
    |        GUESS: #{guess}
    |
    |
    =========
    HEREDOC
  end
  
  def draw_head(secret_word)
    <<~HEREDOC
    +---+     
    |         WORD:   #{secret_word}  
    |   0       
    |         GUESS:  
    |         
    |         MISSES:  
    =========
    HEREDOC
  end
  
  def draw_body(secret_word)
    <<~HEREDOC
    +---+     
    |         WORD:  #{secret_word}
    |   0       
    |   |     GUESS:
    |         
    |         MISSES:
    =========
    HEREDOC
  end
  
  def draw_right_arm(secret_word)
    <<~HEREDOC
    +---+     
    |         WORD:  #{secret_word}  
    |   0        
    |   |\    GUESS:  
    |         
    |         MISSES:
    =========
    HEREDOC
  end
  
  def draw_left_arm(secret_word)
    <<~HEREDOC
    +---+     
    |         WORD:  #{secret_word}
    |   0       
    |  /|\    GUESS:
    |         
    |         MISSES:
    =========
    HEREDOC
  end
  
  def draw_right_leg(secret_word)
    <<~HEREDOC
    +---+     
    |         WORD:  #{secret_word}
    |   0       
    |  /|\    GUESS:
    |    \     
    |         MISSES:
    =========
    HEREDOC
  end
  
  def draw_left_leg(secret_word)
    <<~HEREDOC
    +---+     
    |         WORD:  #{secret_word}
    |   0       
    |  /|\    GUESS:
    |  / \     
    |         MISSES:
    =========
    HEREDOC
  end
  
  def draw_noose(secret_word)
    <<~HEREDOC
    +---+     
    |   |     WORD:  #{secret_word}
    |   0      
    |  /|\    GUESS:
    |  / \     
    |         MISSES:
    =========
    HEREDOC
  end
end