class Phrase

  attr_accessor :phrase
  attr_accessor :word_count

  def initialize(phrase)
    self.phrase = phrase
    self.word_count = {}

    clean!
    count!
  end

  def print!
    word_count.each do |word,cunt|
      puts "#{word}: #{cunt}"
    end
  end

  private

  def clean!
    remove_special_chars!
    downcase!
    handle_commas!
    handle_apostrophes!
    squish_whitespaces!
  end
  
  def remove_special_chars!
    self.phrase.gsub!(/[^a-zA-Z0-9\s',]/,'')
  end

  def downcase!
    self.phrase.downcase!
  end

  def handle_commas!
    self.phrase.gsub!(/,/,' ')
  end

  def handle_apostrophes!
    self.phrase.gsub!(/(?<![a-z0-9])'|'(?![a-z0-9])/,'')
  end

  def squish_whitespaces!
    self.phrase.gsub(/\s+/, ' ').strip
  end

  def count!
    phrase.split(" ").each do |word|
      self.word_count[word] ||= 0
      self.word_count[word] +=1
    end
  end
end