require 'minitest/autorun'
require_relative 'helper'
require_relative '../models/staple.rb' 

class TestStaples < HelperTest

  def test_no_options_returns_not_valid
    refute Staple.options_are_valid(nil)
  end

  def test_cannot_add_item_that_already_exists
    `./ptickle add --name Cheerios --inv 10 --environment test`
    results = `./ptickle add --name Cheerios --inv 10 --environment test`.chomp
    expected = "That item already exists. Use the 'edit' command to change"
    assert_equal(expected,results)
  end
end