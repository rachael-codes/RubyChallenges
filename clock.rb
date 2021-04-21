# Ruby Challenges - Medium
# Program: Clock
# Date: 04/20/21

# Create a clock that is independent of date.

# You should be able to add minutes to and subtract minutes from the time
# represented by a given clock object. Two clock objects that represent the
# same time should be equal to each other.

# You may not use any built-in date or time functionality;
# just use arithmetic operations.

# My solution - fails two tests
# doesn't account for adding or subtracting multiple days
class Clock
  attr_reader :hour, :minute, :total_min

  MINUTES_IN_DAY = 24 * 60

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
    @total_min = hour * 60 + minute
  end

  def self.at(hour, minute=0)
    new(hour, minute)
  end

  def +(add_minutes)
    if total_min + add_minutes > MINUTES_IN_DAY
      @hour, @minute = add_into_next_day(total_min, add_minutes)
    else
      @hour, @minute = add_to_today(total_min, add_minutes)
    end
    Clock.at(@hour, @minute)
  end

  def -(subtract_minutes)
    if total_min - subtract_minutes > 0
      @hour, @minute = sub_from_today(total_min, subtract_minutes)
    else
      @hour, @minute = sub_into_yesterday(total_min, subtract_minutes)
    end
    Clock.at(@hour, @minute)
  end

  def ==(other_time)
    hour == other_time.hour && minute == other_time.minute
  end

  def to_s
    format('%02d:%02d', @hour, @minute)
  end

  private

  def add_into_next_day(total_min, add_minutes)
    ((total_min + add_minutes) - MINUTES_IN_DAY).divmod(60)
  end

  def add_to_today(total_min, add_minutes)
    (total_min + add_minutes).divmod(60)
  end

  def sub_from_today(total_min, sub_minutes)
    (total_min - sub_minutes).divmod(60)
  end

  def sub_into_yesterday(total_min, sub_minutes)
    ((total_min - sub_minutes) + MINUTES_IN_DAY).divmod(60)
  end
end

# LS Solution
class Clock
  attr_reader :hour, :minute

  ONE_DAY = 24 * 60

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute=0)
    new(hour, minute)
  end

  def +(add_minutes)
    minutes_since_midnight = compute_minutes_since_midnight + add_minutes
    while minutes_since_midnight >= ONE_DAY
      minutes_since_midnight -= ONE_DAY
    end

    compute_time_from(minutes_since_midnight)
  end

  def -(sub_minutes)
    minutes_since_midnight = compute_minutes_since_midnight - sub_minutes
    while minutes_since_midnight < 0 >
          minutes_since_midnight += ONE_DAY
    end

    compute_time_from(minutes_since_midnight)
  end

  def ==(other_time)
    hour == other_time.hour && minute == other_time.minute
  end

  def to_s
    format('%02d:%02d', hour, minute);
  end

  private

  def compute_minutes_since_midnight
    total_minutes = 60 * hour + minute
    total_minutes % ONE_DAY
  end

  def compute_time_from(minutes_since_midnight)
    hours, minutes = minutes_since_midnight.divmod(60)
    hours %= 24
    new(hours, minutes)
  end
end
