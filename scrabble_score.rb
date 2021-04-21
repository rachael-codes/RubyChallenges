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

# LS solution (doesn't fail Rubocop)
class Scrabble
  attr_reader :word

  POINTS = {
    'AEIOULNRST' => 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
  }
  def initialize(word)
    @word = word ? word : ''
  end

  def score
    letters = word.upcase.gsub(/[^A-Z]/, '').chars

    total = 0
    letters.each do |letter|
      POINTS.each do |letter_options, point|
        total += point if letter_options.include?(letter)
      end
    end
    total
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

# A good student solution
class Scrabble
  def initialize(word)
    @word = word.is_a?(String) ? word : ''
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    @word.chars.map { |char| letter_value(char) }.sum
  end

  private

  def letter_value(char) #Note: Rubocop complains about Cyclomatic complexity
    case char
    when /[^A-Z]/i then 0
    when /[AEIOULNRST]/i then 1
    when /[DG]/i then 2
    when /[BCMP]/i then 3
    when /[FHVWY]/i then 4
    when /[K]/i then 5
    when /[JX]/i then 8
    when /[QZ]/i then 10
    end
  end
end
