#!/usr/bin/env ruby
require_relative './lib/environment.rb'
require 'csv'
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
  import_staples(database)
  import_purchases(database)
end

def create_tables(database_connection)
  database_connection.execute("CREATE TABLE staples (id INTEGER PRIMARY KEY AUTOINCREMENT, name varchar(50), targetInventory integer, aisle number, nextPurchaseDate date)")
  database_connection.execute("CREATE TABLE purchases (id INTEGER PRIMARY KEY AUTOINCREMENT, name varchar(50), daysStocked integer)")
end

def import_staples(db)
  CSV.foreach("./data/items.csv") do |row|
    `./ptickle add --name \"#{row[0]}\" --inv #{row[1]} --aisle #{row[2]} --environment test`
  end
end

def import_purchases(db)
  CSV.foreach("./data/purchases.csv") do |row|
    `./ptickle set --name \"#{row[0]}\" --days #{row[1]} --environment test`
  end
end

