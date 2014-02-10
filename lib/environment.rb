require 'rubygems'
require 'bundler/setup'
require 'active_record'
# require 'sqlite3'

project_root = File.dirname(File.absolute_path(__FILE__))
Dir.glob(project_root + "/../models/*.rb").each{|f| require f}

require_relative 'database'
require 'logger'
require 'yaml'

class Environment

  def self.environment= environment
    @@environment = environment
  end

  # def self.database_connection(environment = "production")
  #   @connection ||= SQLite3::Database.new("db/pantryTickler_#{@@environment}.sqlite3")
  # end

  def self.connect_to_database
    connection_details = YAML::load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection(connection_details[@@environment])
  end

  def self.logger
    @@logger ||= Logger.new("logs/#{@@environment}.log")
  end

end