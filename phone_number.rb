# RB 130 Ruby Challenges (deprecated) - Medium 1
# Program: Phone Number
# Date: 04/21/21

# Write a program that cleans up user-entered phone numbers
# so that they can be sent as SMS messages.

# The rules are as follows:

#     If the phone number is less than 10 digits assume that it is bad number
#     If the phone number is 10 digits assume that it is good
#     If the phone number is 11 digits and the first number is 1,
#        trim the 1 and use the last 10 digits
#     If the phone number is 11 digits and the first number is not 1,
#        then it is a bad number
#     If the phone number is more than 11 digits assume that it is a bad number

class PhoneNumber
  INVALID = '0000000000'

  def initialize(phone_number)
    @phone_number = phone_number
  end

  def number
    return INVALID if @phone_number.match?(/[a-z]/i)
    num_arr = @phone_number.scan(/\d/)
    return INVALID if invalid_size?(num_arr) || first_not_one(num_arr)
    clean_possible_first_num_one(num_arr).join
  end

  def invalid_size?(arr)
    arr.size < 10 || arr.size > 11
  end

  def first_not_one(arr)
    arr.size == 11 && arr.first != '1'
  end

  def clean_possible_first_num_one(arr)
    arr.size == 11 ? arr[1..-1] : arr
  end

  def area_code
    PhoneNumber.new(@phone_number).number[0..2]
  end

  def to_s
    clean_num = PhoneNumber.new(@phone_number).number
    "(#{clean_num[0..2]}) #{clean_num[3..5]}-#{clean_num[6..9]}"
  end
end
