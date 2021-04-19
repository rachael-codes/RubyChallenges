# Ruby Challenges (deprecated) - Medium 1
# Program: Secret Handshake
# Date: 04/18/21

# My solution
class SecretHandshake
  def initialize(dec)
    dec = dec.to_i if dec.to_i != 0
    dec.to_i == 0 ? @binary_array = [] : @binary_array = dec.to_s(2).chars
  end

  def commands
    commands = []
    commands << 'wink' if @binary_array[-1] == '1'
    commands << 'double blink' if @binary_array[-2] == '1'
    commands << 'close your eyes' if @binary_array[-3] == '1'
    commands << 'jump' if @binary_array[-4] == '1'
    commands.reverse! if @binary_array[-5] == '1'
    commands
  end
end
