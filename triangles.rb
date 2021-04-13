# Program: Triangles 
# Date: 04/12/21

# INSTRUCTIONS
# Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

# Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of 
# any two sides must be greater than the length of the third side.

# PEDAC 
# input: 3 positive integers
# output: string -- 'scalene' or 'isosceles' or 'equilateral'

# EXPLICIT: 
# 	each side must be greater than 0
# 	the sum of the lengths of ANY two sides must be greater than or equal to the length of the last side
# TYPES 
# 	An equilateral triangle has all three sides the same length.
# 	An isosceles triangle has exactly two sides of the same length.
# 	A scalene triangle has all sides of different lengths.

class Triangle
	def initialize(side1, side2, side3)
		@sides = [side1, side2, side3]
		raise ArgumentError.new('Invalid triangle lengths') unless valid?
	end 

	def valid?
		sides.min > 0 &&
		sides[0] + sides[1] > sides[2] && 
		sides[0] + sides[2] > sides[1] &&
		sides[1] + sides[2] > sides[0] 
	end 

	def equilateral? 
		sides.uniq.size == 1 
	end 

	def isosceles?
		sides.uniq.size == 2 
	end 

	def kind 
		if equilateral?
			'equilateral' 
		elsif isosceles?
			'isosceles'
		else 
			'scalene'
		end 
	end 

	private 

	attr_reader :sides
end 
