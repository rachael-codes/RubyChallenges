# Ruby Challenges - Medium
# Program: Pig Latin
# Date: 04/21/21

# THINK ABOUT HOW TO DO WITH REGEX INSTEAD

# intput: string
# output: string, pig-latinized

# explicit - add 'ay' to the end of each string
# implicit - move the first consonant sound to the
#            end before adding 'ay'
#     -consonant sound is not just a single consonant
# but a sound like 'ch', 'qu', squ, thr, sch, xray, yttria

# Algo
# -make CONSTANT that points to arr of consonant clusters
# -if regex matches a consonant or something in CONSTANT,
#   assign to 'second' variable and delete from string
# -assign rest of string to `first` variable
# -return first + second + 'ay'
# /ch||qu||squ||thr||sch||xray||yytria/

class PigLatin
  SPECIAL_CASES = %w(xray yttria)

  def self.translate(string)
    string.split.map! { |word| change_one(word) }.join(' ')
  end

  def self.vowel_starter(string)
    "#{string}ay"
  end

  def self.con_or_cluster_starter(first_con, first_cluster)
    first_cluster.nil? ? first_con : first_cluster.first
  end

  def self.non_vowel_starter(string, first)
    "#{string.sub(first, '')}#{first}ay"
  end

  def self.change_one(string)
    return "#{string}ay" if SPECIAL_CASES.include?(string)

    first_con = string.scan(/^[^aeiou]/i).first
    first_cluster = string.scan(/(ch|qu|squ|thr|th|sch)/).first

    starter = con_or_cluster_starter(first_con, first_cluster)
    starter.nil? ? vowel_starter(string) : non_vowel_starter(string, starter)
  end
end

# p PigLatin.new.translate('bus')
# p PigLatin.new.translate('xray')
# p PigLatin.new.translate('yytria')
# p PigLatin.new.translate('ear')
# p PigLatin.translate('koala bear')
# p PigLatin.translate('school')
# p PigLatin.translate('ear')
# p PigLatin.translate('yytria')
