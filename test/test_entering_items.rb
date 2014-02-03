require_relative 'helper'

class TestEnteringStaples < HelperTest#::Minitest::Unit::TestCase

  def test_no_item_name_on_command_line
    command = `./ptickle add`
    assert_equal "You must provide the name of the product.", command.strip
  end

  def test_no_target_inventory_amount_on_command_line
    command = `./ptickle add --name Cheerios`
    assert_equal "You must include [\"aisle\"] with the add command.", command.strip
  end
  
  def test_add_item_will_add_Item_to_database
    actual = `./ptickle add --name crackers --aisle 5 --environment test`
    expected = <<EOS.chomp
You have added the following:
name: crackers, aisle: 5
EOS
    assert_equal expected, actual.strip
  end

  def test_entering_Print_with_invalid_options
    actual = `./ptickle print`.chomp
    assert_equal "You must include [\"shopping day count\"] with the print command.", actual
  end

  def test_printing_list
    # skip
    `./ptickle add --name Cheerios --aisle 5 --environment test`
    `./ptickle add --name oatmeal --aisle 5 --environment test`
    `./ptickle add --name crackers aisle 18 --environment test`
    `./ptickle set --name Cheerios --days 2 --environment test`
    `./ptickle set --name oatmeal --days 4 --environment test`
    `./ptickle set --name crackers --days 8 --environment test`
    actual = `./ptickle print --shopping_days 7 --environment test`.chomp
    expected = <<EOS.chomp
             Item Name     Aisle
             ---------     -----
              Cheerios       5
               oatmeal       5
EOS
    assert_equal(expected, actual)
  end

  def test_adding_item_with_aisle_included
    actual = `./ptickle add --name crackers --aisle 18 --environment test`
    expected = <<EOS.chomp
You have added the following:
name: crackers, aisle: 18
EOS
    assert_equal expected, actual.strip

  end

end