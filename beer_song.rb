# Program: Beer Song
# Date: 04/13/21

# My solution
module MessagesForTwoOrFewerBottles
  TWO_BOTTLE_MESSAGE = "2 bottles of beer on the wall, 2 bottles of beer.\n" +
                       "Take one down and pass it around, 1 bottle of beer on the wall.\n"

  ONE_BOTTLE_MESSAGE = "1 bottle of beer on the wall, 1 bottle of beer.\n" +
                       "Take it down and pass it around, no more bottles of beer on the wall.\n"

  ZERO_BOTTLE_MESSAGE = "No more bottles of beer on the wall, no more bottles of beer.\n"
  "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
end

class BeerSong
  include MessagesForTwoOrFewerBottles

  def self.verse(*numbers)
    range = (numbers.last..numbers.first).to_a.reverse
    range.each do |num|
      case verse
      when 2 			then puts TWO_BOTTLE_MESSAGE
      when 1 			then puts ONE_BOTTLE_MESSAGE
      when 0 			then puts ZERO_BOTTLE_MESSAGE
      else
        puts "#{num} bottles of beer on the wall, #{num} bottles of beer."
        puts "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n\n"
      end
    end
  end

  def self.lyrics
    self.verse(99, 0)
  end
end

# LS Solution
class Verse
  attr_reader :bottles

  def initialize(bottles)
    @bottles = bottles
  end

  def single_verse
    case bottles
    when 0
      zero_bottle_verse
    when 1
      single_bottle_verse
    when 2
      two_bottle_verse
    else
      default_verse
    end
  end

  private

  def default_verse
    "#{bottles} bottles of beer on the wall, #{bottles}" +
      " bottles of beer.\nTake one down and pass it around, " +
      "#{bottles - 1} bottles of beer on the wall.\n"
  end

  def two_bottle_verse
    "2 bottles of beer on the wall, 2 bottles of beer.\n" +
      "Take one down and pass it around, 1 bottle of beer " +
      "on the wall.\n"
  end

  def single_bottle_verse
    "1 bottle of beer on the wall, 1 bottle of beer.\n" +
      "Take it down and pass it around, no more bottles of beer " +
      "on the wall.\n"
  end

  def zero_bottle_verse
    "No more bottles of beer on the wall, no more bottles " +
      "of beer.\nGo to the store and buy some more, 99 bottles " +
      "of beer on the wall.\n"
  end
end

class BeerSong
  def self.verse(number)
    Verse.new(number).single_verse
  end

  def self.verses(start, stop)
    current_verse = start
    result = []

    while current_verse >= stop
      result << "#{verse(current_verse)}"
      current_verse -= 1
    end

    result.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end
