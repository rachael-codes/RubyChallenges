# RB130 - Ruby Challenges (Deprecated)Easy 1Word Count
# Program: Word Count
# Date: 04/18/21

# Write a program that given a phrase can count the occurrences of each word in that phrase.

# For example, if we count the words for the input "olly olly in come free", we should get:
		# olly: 2
		# in: 1
		# come: 1
		# free: 1

class Phrase
	def initialize(string)
		@string = string 
		@words = string.downcase.scan(/\b[\w']+\b/)
	end 


	def word_count
		@words.tally
	end 
end 
