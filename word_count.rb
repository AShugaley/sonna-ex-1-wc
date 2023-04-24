class Phrase

  attr_accessor :phrase
  attr_accessor :word_count

  def initialize(phrase)
    self.phrase = phrase
    self.word_count = Hash.new(0)

    clean_phrase
    count_words
  end

  def print
    word_count.each do |word, count|
      puts "#{word}: #{count}"
    end
  end

  private

  def clean_phrase
    remove_special_chars
    downcase
    handle_commas
    handle_apostrophes
    squish_whitespaces
  end
  
  def remove_special_chars
    self.phrase.gsub!(/[^a-zA-Z0-9\s',]/,'')
  end

  def downcase
    self.phrase.downcase!
  end

  def handle_commas
    self.phrase.gsub!(/,/,' ')
  end

  def handle_apostrophes
    self.phrase.gsub!(/(?<![a-z0-9])'|'(?![a-z0-9])/,'')
  end

  def squish_whitespaces
    self.phrase.gsub(/\s+/, ' ').strip
  end

  def count_words
    phrase.split(" ").each { |word| word_count[word] +=1 }
  end
end
