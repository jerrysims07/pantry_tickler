require_relative 'helper'

class TestEnteringStaples < HelperTest#::Minitest::Unit::TestCase

  def test_no_item_name_on_command_line
    command = `./ptickle add`
    assert_equal "You must provide the name of the product.", command.strip
  end

  def test_no_target_inventory_amount_on_command_line
    command = `./ptickle add --name Cheerios`
    assert_equal "You must include [\"target inventory amount\"] with the add command.", command.strip
  end
  
  def test_add_item_will_add_Item_to_database
    actual = `./ptickle add --name crackers --inv 8 --environment test`
    expected = <<EOS.chomp
You have added the following:
name: crackers, target inventory: 8 days
EOS
    assert_equal expected, actual.strip
  end

  def test_entering_Print_with_invalid_options
    skip
    actual = `./ptickle print`
    assert_equal "You must include shopping day count with 'print' command.", actual
  end

  def test_printing_list
    skip
    `./ptickle add --name Cheerios --inv 10 --environment test`
    `./ptickle set --name Cheerios --days 2`
    `./ptickle add --name oatmeal --inv 10 --environment test`
    `./ptickle set --name oatmeal --days 4`
    `./ptickle add --name crackers --inv 10 --environment test`
    `./ptickle set --name crackers --days 8`
    actual = `./ptickle print --days 7`
    expected = <<EOS.chomp
Grocery List:
Cheerios
oatmeal
EOS
    assert_equal(expected, actual)
  end

end