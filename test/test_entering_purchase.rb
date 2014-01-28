require 'minitest/autorun'

class TestEnteringPurchases < Minitest::Unit::TestCase

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
Stub: You would have added a purchase here.
EOS
    assert_equal expected, actual.strip
  end

end