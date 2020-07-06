module Display
  def display_main_menu
    system 'clear'
    <<~HEREDOC.chomp
      Welcome to the famous "HANGMAN" game!
  
      1. Play Game
      
      2. Load Game

      3. Quit
  
      Please, make your choice: 
    HEREDOC
  end

  def display_library_loading
    system 'clear'
    print "Loading library "
    12.times do
      sleep(0.2)
      print "."
    end
    puts "#{green("Done!")} "
  end

  def display_word_generating
    print "Generating secret word "
    12.times do
      sleep(0.2)
      print "."
    end
    puts "#{green("Done!")} "
  end

  def display_game_start
    <<~HEREDOC
      And here you are... on a cold November day of rain, snow and hail...
      with the rope around your neck... You still have a chance to escape...
      Guess the secret word and you'll be free!
    HEREDOC
  end

  def display_show_pattern_msg
    puts "\nYou secret word looks like this: "
  end

  def display_guess_prompt
    print "\nMake your guess: "
  end

  def display_game_shortcuts
    <<~HEREDOC

      Press #{bold("2")} anytime you want to save your current game or 
            #{bold("0")} to go back to main menu.
            
    HEREDOC
  end

  def display_report_game_saved
    puts "\nYour game was successfully saved."
  end

  def display_error_invalid_input
    print "\nERROR: invalid input"
  end

  def display_valid_input_example
    print "A guess must contain only the latin alphabet letters (A-Z and a-z).\nPlease try again: "
  end

  def display_game_over
    puts "\nPerished..."
    # puts "Death is not a hunter unbeknownst to its prey, one is always aware that it lies in wait."
  end

  def display_congratulations
    puts "\n☆彡(ノ^ ^)ノ\nYes, you made it through!\nCongratulations and celebrations!\nヘ(^ ^ヘ)☆彡"
  end

  def display_play_again
    print "\nOne more round?\nPress 'y' for yes (or any other key for no): "
  end

  def display_closing_greeting
    puts "\nThanks and have a nice day!"
  end
end