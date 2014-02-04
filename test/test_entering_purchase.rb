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
    `./ptickle add --name Cheerios --aisle 5 --environment test`
    actual = `./ptickle purchase --name Cheerios --days 10 --environment test`
    expected = <<EOS.chomp
Cheerios is now scheduled to be purchased on 2014-02-13.
EOS
    assert_equal expected, actual.strip
  end

  def test_add_purchase_will_add_Purchase_to_database_existing_date
    `./ptickle add --name Cheerios --aisle 5 --environment test`
    `./ptickle set --name Cheerios --days 4 --environment test`
    actual = `./ptickle purchase --name Cheerios --days 10 --environment test`
    expected = <<EOS.chomp
Cheerios is now scheduled to be purchased on 2014-02-18.
EOS
    assert_equal expected, actual.strip
  end

end