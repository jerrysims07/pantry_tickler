require 'minitest/autorun'
require_relative '../lib/environment'

class HelperTest < Minitest::Unit::TestCase
  def setup
    Environment.type "test"
  end

  def database
    Environment.database_connection
  end

  def teardown
    database.execute("delete from staples")
    database.execute("delete from purchases")
  end

end