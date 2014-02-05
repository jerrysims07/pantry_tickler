require 'date'
require 'minitest/autorun'
require_relative 'helper'

class TestSettingInventory < HelperTest

  def test_no_item_name_on_command_line
    command = `./ptickle set`
    assert_equal "You must provide the name of the product.", command.strip
  end
  
  def test_set_inventory_will_update_database
    `./ptickle add --name oatmeal --aisle 5 --environment test`
    actual = `./ptickle set --name oatmeal --days 25 --environment test`
    new_date = (Time.now+ 25*24*60*60).strftime("%Y-%m-%d")
    expected = <<EOS.chomp
oatmeal  is now scheduled to be purchased on #{new_date}.
EOS
    assert_equal expected, actual.strip
  end

end