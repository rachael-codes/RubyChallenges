# Ruby Challenges - Medium
# Program: Pig Latin
# Date: 04/21/21

# My solution
class PigLatin
  def self.translate(string)
    string.split.map! { |word| change_one(word) }.join(' ')
  end

  def self.non_vowel_starter(string, first)
    "#{string.sub(first, '')}#{first}ay"
  end

  def self.con_or_cluster_starter(beginning_non_vowel, beginning_cluster)
    beginning_cluster.nil? ? beginning_non_vowel : beginning_cluster.first
  end

  def self.change_one(string)
    beginning_non_vowel = string.scan(/([^aeiou])([^yt])([^xr])/).first
    beginning_cluster = string.scan(/(ch|qu|squ|thr|th|sch)/).first

    starter = con_or_cluster_starter(beginning_non_vowel, beginning_cluster)
    starter.nil? ? "#{string}ay" : non_vowel_starter(string, starter)
  end
end

# Great Regex solution
class PigLatin
  def self.translate(str)
    str.split.map do |word|
      case word[0, 3]
      when /([aeiou].|yt|xr)./  then word
      when /(.qu|thr|sch)/      then word[3..-1] + word[0, 3]
      when /(ch|qu|th)./        then word[2..-1] + word[0, 2]
      else                           word[1..-1] + word[0]
      end + 'ay'
    end.join(' ')
  end
end
