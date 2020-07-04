class Host
  attr_accessor :contents
  attr_reader :secret_word
  
  def initialize
    puts "Host initialized."
  end
  
  def load_library
    puts "Loading library..."
    library = File.open "5desk.txt"
    @contents = library.read
  end
  
  def choose_word
    puts "Choosing word..."
    @secret_word = contents.scan(/\w+/).select { |word| word.length.between?(5, 12) }.sample
    puts "Secret word is #{@secret_word}"
  end
end