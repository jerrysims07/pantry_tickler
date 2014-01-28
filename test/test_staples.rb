require 'minitest/autorun'
require_relative '../models/staple.rb' 

class TestStaples < Minitest::Unit::TestCase

  def test_no_options_returns_not_valid
    refute Staple.options_are_valid(nil)
  end

end