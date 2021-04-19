require 'minitest/autorun'
require_relative 'secret_handshake'

class SecretHandshakeTest < Minitest::Test
  def test_handshake_1_to_wink
    handshake = SecretHandshake.new(1) # binary - 1
    assert_equal ['wink'], handshake.commands
    # wink = 1
  end

  # decimal -> program finds in binary -> interprets binary and returns an array of commands that correspond to places in the binary number
  def test_handshake_10_to_double_blink
    handshake = SecretHandshake.new(2) # binary - 10 (2 places)
    assert_equal ['double blink'], handshake.commands
    # 10
  end

  def test_handshake_100_to_close_your_eyes
    handshake = SecretHandshake.new(4) # binary - 100
    assert_equal ['close your eyes'], handshake.commands
  end

  def test_handshake_1000_to_jump
    handshake = SecretHandshake.new(8) # binary - 1000
    assert_equal ['jump'], handshake.commands
  end

  def test_handshake_11_to_wink_and_double_blink
    handshake = SecretHandshake.new(3) # binary - 11 (10 + 1)
    assert_equal ['wink', 'double blink'], handshake.commands
  end

  def test_handshake_10011_to_double_blink_and_wink
    handshake = SecretHandshake.new(19) # binary - 10011 (10000 + 10 + 1)
    assert_equal ['double blink', 'wink'], handshake.commands
  end

  def test_handshake_11111_to_double_blink_and_wink
    handshake = SecretHandshake.new(31) # binary - 11111
    expected = ['jump', 'close your eyes', 'double blink', 'wink']
    assert_equal expected, handshake.commands
  end

  def test_valid_string_input
    handshake = SecretHandshake.new('1')
    assert_equal ['wink'], handshake.commands
  end

  def test_invalid_handshake
    handshake = SecretHandshake.new('piggies')
    assert_equal [], handshake.commands
  end
end
