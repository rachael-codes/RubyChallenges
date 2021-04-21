# Ruby Challenges - Medium
# Program: Diamond
# Date: 04/20/21

# The diamond exercise takes as its input a letter, and outputs it
# in a diamond shape. Given a letter, it prints a diamond starting
# with 'A', with the supplied letter at the widest point.

# The first row contains one 'A'.
# The last row contains one 'A'.
# All rows, except the first and last, have exactly 2 identical letters.
# The diamond is horizontally symmetric.
# The diamond is vertically symmetric.
# The diamond has a square shape (width equals height).
# The letters form a diamond shape.
# The top half has the letters in ascending order.
# The bottom half has the letters in descending order.
# The four corners (containing the spaces) are triangles.

class Diamond
  ALPHA = ('A'..'Z').to_a
  NUMS = %w(0 1 3 5 7 9 11 13 15 17 19 21 23 25
            27 29 31 33 35 37 39 41 43 45 47 49)
  KEY = ALPHA.zip(NUMS).to_h

  def self.find_target_num(current_letter)
    target_num = ''
    KEY.each do |key, value|
      target_num = value.to_i if key == current_letter
    end
    target_num
  end

  def self.make_row(current_letter)
    return 'A' if current_letter == 'A'
    target_num = find_target_num(current_letter)
    current_letter + ' ' * target_num + current_letter
  end

  def self.find_row_length(letter)
    find_target_num(letter) + 2
  end

  def self.center_row(current_letter, largest_letter)
    make_row(current_letter).center(find_row_length(largest_letter))
  end

  def self.make_top_rows(letter)
    rows = []
    KEY.each_key do |hash_key|
      rows << center_row(hash_key, letter)
      break if hash_key == letter
    end
    rows
  end

  def self.make_bottom_rows(bottom_rows)
    rows = []
    bottom_rows.reverse_each.with_index do |row, idx|
      rows << row unless idx == 0
    end
    rows
  end

  def self.make_diamond(letter)
    return "A\n" if letter == 'A'
    result = []
    result << make_top_rows(letter)
    result << make_bottom_rows(make_top_rows(letter))
    "#{result.join("\n")}\n"
  end
end
