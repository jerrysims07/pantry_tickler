require 'minitest/autorun'
require_relative '../lib/environment'

class HelperTest < Minitest::Unit::TestCase
  def setup
    Environment.environment= "test"
    Environment.connect_to_database
  end

  # def database
  # end

  def teardown
    Staple.destroy_all
    # database.execute("delete from staples")
    # database.execute("delete from purchases")
  end

end