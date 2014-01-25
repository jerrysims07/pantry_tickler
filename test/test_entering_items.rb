require 'minitest/autorun'

class TestEnteringItems < Minitest::Unit::TestCase

  def test_no_item_name_on_command_line
    command = `./ptickle add`
    assert_equal "You must provide the name of the product you are adding.\nYou must include target inventory amount when adding items.", command.strip
  end

  def test_no_target_inventory_amount_on_command_line
    command = `./ptickle add Cheerios`
    assert_equal "You must include target inventory amount when adding items.", command.strip
  end
  
  def test_add_item_will_add_Item_to_database
    command = `./ptickle add -name Cheerios -inv 10`
    assert_equal "stub -- You totally added an item (NOT REALLY)", command.strip
  end

end