#!/usr/bin/env ruby
require_relative './lib/environment.rb'
# -*- ruby -*-

require 'rake/testtask'
Rake::TestTask.new() do |t|
  t.pattern = "test/test_*.rb"
end

desc "Run tests"
task :default => :test

desc 'production database setup'
task :bootstrap_database do
  Environment.type "production"
  database = Environment.database_connection
  create_tables(database)
end

desc 'test database setup'
task :test_prepare do
  File.delete("./db/pantryTickler_test.sqlite3")
  Environment.type "test"
  database = Environment.database_connection
  create_tables(database)
end

def create_tables(database_connection)
  database_connection.execute("CREATE TABLE staples (id INTEGER PRIMARY KEY AUTOINCREMENT, name varchar(50), targetInventory integer)")
end