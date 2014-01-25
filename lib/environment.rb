require 'sqlite3'

class Environment

  def self.type type
    @@type = type
  end

  def self.database_connection(environment = "production")
    @connection ||= SQLite3::Database.new("db/pantryTickler_#{@@type}.sqlite3")
  end
end