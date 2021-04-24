# Program: Scrabble Score
# Date: 04/12/21

# Write a program that, given a word, computes the Scrabble score for that word.

# My original solution - fails Rubocop 
class Scrabble
  def initialize(word)
    @word = word ? word : ''
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    score = 0
    word.chars.each do |char|
      when char.match?(/[AEIOULNRST]/i)
        score += 1
      elsif char.match?(/[DG]/i)
        score += 2
      elsif char.match?(/[BCMP]/i)
        score += 3
      elsif char.match?(/[FHVWY]/i)
        score += 4
      elsif char.match?(/[K]/i)
        score += 5
      elsif char.match?(/[JX]/i)
        score += 8
      elsif char.match?(/[QZ]/i)
        score += 10
      end
    end
    score
  end

  private

  attr_reader :word
end

# My better solution
class Scrabble
  KEY = { 
    1 => 'AEIOULNRST',
    2 => 'DG',
    3 => 'BCMP',
    4 => 'FHVWY',
    5 => 'K',
    8 => 'JX',
    10 => 'QZ'
    }.freeze

  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.nil?

    score = 0
    @word.chars.each do |char|
      KEY.each do |num, letters|
        score += num if letters.chars.include?(char.upcase)
      end
    end
    score
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
