require 'minitest/autorun'
require_relative 'helper'

class TestEnteringPurchases < HelperTest

  def test_no_item_name_on_command_line
    command = `./ptickle purchase`
    assert_equal "You must provide the name of the product.", command.strip
  end

  def test_no_days_stocked_on_command_line
    command = `./ptickle purchase --name Cheerios`
    assert_equal "You must include [\"days stocked\"] when adding purchases.", command.strip
  end
  
  def test_add_purchase_will_add_Purchase_to_database
    actual = `./ptickle purchase --name Cheerios --days 10 --environment test`
    expected = <<EOS.chomp
You have added the following purchase:
name: Cheerios, days stocked: 10
EOS
    assert_equal expected, actual.strip
  end

end