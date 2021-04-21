# Ruby Challenges - Medium
# Program: Robot Name
# Date: 04/20/21

class Robot
  @@all_names = []

  def name
    return @name if @name
    @name = make_name while @@all_names.include?(@name) || @name.nil?
    @@all_names << @name
    @name
  end

  def reset
    @@all_names.delete(@name)
    @name = nil
  end

  private

  def make_name
    name = ''
    2.times { name << ('A'..'Z').to_a.sample }
    3.times { name << ('0'..'9').to_a.sample }
    name
  end
end
