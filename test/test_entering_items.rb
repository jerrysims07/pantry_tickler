require 'minitest/autorun'

class TestEnteringItems < Minitest::Unit::TestCase

  def test_no_item_name_on_command_line
    command = `./ptickle add`
    assert_equal "You must provide the name of the product you are adding.\nYou must include target inventory amount when adding items.", command.strip
  end

  def test_no_target_inventory_amount_on_command_line
    command = `./ptickle add --name Cheerios`
    assert_equal "You must include target inventory amount when adding items.", command.strip
  end
  
  def test_add_item_will_add_Item_to_database
    actual = `./ptickle add --name Cheerios --inv 10 --environment test`
    expected = <<EOS.chomp
Stub: You would have added something here.
EOS
    assert_equal expected, actual.strip
  end

end