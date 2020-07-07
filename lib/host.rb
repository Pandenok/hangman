class Host
  include Display
  include Colorable

  attr_accessor :contents
  attr_reader :secret_word

  def initialize; end

  def load_library
    print display_library_loading
    library = File.open '5desk.txt'
    @contents = library.read
  end

  def choose_word
    puts display_word_generating
    @secret_word = contents.scan(/\w+/).select { |word| word.length.between?(5, 12) }.sample.upcase
    puts "Secret word is #{@secret_word}"
  end
end
