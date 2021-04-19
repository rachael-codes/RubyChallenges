# Program: Point Mutations
# Date: 04/12/21

# INSTRUCTIONS
# Write a program that can calculate the Hamming distance between two DNA strands.

# Example
#     GAGCCTACTAACGGGAT
#     CATCGTAATGACGGCCT
#     ^ ^ ^  ^ ^    ^^
# = 7

# Input: two strings
# Output: integer that reps the # of differences

# EXPLICIT
# The Hamming distance is only defined for sequences of equal length.
# If you have two sequences of unequal length, you should compute the Hamming distance over the shorter length.

class DNA
  def initialize(dna_string)
    @dna_string = dna_string
  end

  def hamming_distance(dna_to_compare)
    total_differences = 0
    shorter = dna_string.size >= dna_to_compare.size ? dna_to_compare : dna_string
    counter = 0

    until counter == shorter.size
      total_differences += 1 if dna_string[counter] != dna_to_compare[counter]
      counter += 1
    end

    total_differences
  end

  private

  attr_reader :dna_string
end
