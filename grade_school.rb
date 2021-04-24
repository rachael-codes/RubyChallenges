# My initial solution
class School
  def initialize
    @roster = {}
  end

  def add(name, grade)
    if @roster.keys.include?(grade)
      @roster[grade] << name
    else
      @roster[grade] = [name]
    end
  end

  def grade(grade)
    return [] if !@roster.keys.include?(grade)
    @roster.each do |level, students|
      return students if grade == level
    end
  end

  def to_h
    hsh = {}
    @roster.sort.each do |grade, students|
      students = students.sort
      if hsh.keys.include?(grade)
        hsh[grade] << students.flatten
      else
        hsh[grade] = [students].flatten
      end
    end
    hsh
  end
end

# Better solution
class School
  attr_reader :roster

  def initialize
    @roster = Hash.new { |roster, grade| roster[grade] = [] }
  end

  def add(student, grade)
    roster[grade] << student
  end

  def grade(num)
    roster[num]
  end

  def to_h
    roster.sort.map { |grade, list| [grade, list.sort] }.to_h
  end
end

# school = School.new
# school.add('kyle', 5)
# school.add('amy', 3)
# school.add('ben', 5)
# puts school.to_h
