# Ruby Challenges - Medium
# Program: Custom Set
# Date: 04/20/21

class CustomSet
  def initialize(*arr)
    @set = arr.flatten
  end

  def sort
    @set.sort
  end

  def empty?
    @set == []
  end

  def contains?(num)
    set.include?(num)
  end

  def subset?(other_set)
    set.all? { |num| other_set.set.include?(num) }
  end

  def disjoint?(other_set)
    set.none? { |num| other_set.set.include?(num) }
  end

  def eql?(other_set)
    set.sort.uniq == other_set.sort.uniq
  end

  def add(new_num)
    set.push(new_num) unless contains?(new_num)
    self
  end

  def ==(other_set)
    eql?(other_set)
  end

  def intersection(other_set)
    same = set.select { |num| other_set.contains?(num) }
    CustomSet.new(same)
  end

  def difference(other_set)
    diff = set.select { |num| !other_set.contains?(num) }
    CustomSet.new(diff)
  end

  def union(other_set)
    result = CustomSet.new(set)
    other_set.set.each { |num| result.add(num) }
    result
  end

  protected

  attr_accessor :set
end
