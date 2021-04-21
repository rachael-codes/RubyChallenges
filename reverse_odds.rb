class ReverseOdds
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def convert
    new_string = string.split.map.with_index do |word, idx|
      if idx.even?
        word
      elsif word.match?(/[^a-z]$/)
        word.reverse[1..-1] + word.reverse[0]
      else
        word.reverse
      end
    end.join(' ')

    0.upto(new_string.size - 1) do |x|
      puts new_string.slice(0..x)
    end
  end
end

ReverseOdds.new("hello word.").convert
# Desired output...
# h
# he
# hel
# hell
# hello
# hello
# hello d
# hello dr
# hello dro
# hello drow
# hello drow.
