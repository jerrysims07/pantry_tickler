require 'minitest/autorun'
require_relative '../models/purchase.rb' 

class TestPurchases < Minitest::Unit::TestCase

  def test_new_purchase_creates_instance_of_purchase_class
    p = Purchase.new("Cheerios", 10, "1/27/2014")
    assert_equal Purchase, p.class
  end

end