# Program: Anagrams
# Date: 04/12/21

# INSTRUCTIONS
# Write a program that takes a word and a list of possible anagrams and selects the
# correct sublist that contains the anagrams of the word.

class Anagram
  attr_reader :word_to_match

  def initialize(word_to_match)
    @word_to_match = word_to_match
  end

  def match(array_of_words)
    array_of_words.select do |word|
      next if word.downcase == word_to_match.downcase
      sorted(word) == sorted(word_to_match)
    end
  end

  def sorted(str)
    str.downcase.chars.sort.join
  end
end
