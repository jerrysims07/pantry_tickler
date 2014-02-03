require 'minitest/autorun'
require_relative 'helper'
require_relative '../models/staple.rb' 

class TestStaples < HelperTest

  def test_no_options_returns_not_valid
    refute Staple.options_are_valid(nil)
  end

  def test_cannot_add_item_that_already_exists
    `./ptickle add --name Cheerios --inv 10 --aisle 5 --environment test`
    results = `./ptickle add --name Cheerios --inv 10 --aisle 5 --environment test`.chomp
    expected = "That item already exists. Use the 'edit' command to change"
    assert_equal(expected,results)
  end

  def test_delete_items_with_invalid_item
    results = `./ptickle delete --name hambone --environment test`.chomp
    expected = "That item was not found"
    assert_equal(expected, results)
  end

  def test_delete_items_with_valid_entry
    `./ptickle add --name hambone --inv 10 --aisle 1.99 --environment test`
    results = `./ptickle delete --name hambone --environment test`.chomp
    expected = "You have deleted 'hambone' from the database."
    assert_equal(expected, results)
  end
end