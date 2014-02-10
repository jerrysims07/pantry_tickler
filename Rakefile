#!/usr/bin/env ruby
require_relative './lib/environment.rb'
require 'active_record'
require 'csv'
# -*- ruby -*-

require 'rake/testtask'
Rake::TestTask.new(test: "db:test:prepare") do |t|
  t.pattern = "test/test_*.rb"
end

desc "Run tests"
task :default => :test

# desc 'production database setup'
# task :bootstrap_database do
#   Environment.type "production"
#   database = Environment.database_connection
#   create_tables(database)
#   import_staples(database, "production")
#   import_purchases(database, "production")
# end

# desc 'test database setup'
# task :test_prepare do
#   File.delete("./db/pantryTickler_test.sqlite3")
#   Environment.type "test"
#   database = Environment.database_connection
#   create_tables(database)
#   import_staples(database, "test")
#   import_purchases(database, "test")
# end

# def create_tables(database_connection)
#   database_connection.execute("CREATE TABLE staples (id INTEGER PRIMARY KEY AUTOINCREMENT, name varchar(50), aisle number, nextPurchaseDate date)")
#   database_connection.execute("CREATE TABLE purchases (id INTEGER PRIMARY KEY AUTOINCREMENT, name varchar(50), daysStocked integer)")
# end

db_namespace = namespace :db do
  desc "Migrate the db"
  task :migrate do
    Environment.environment = 'production'
    Environment.connect_to_database
    ActiveRecord::Migrator.migrate("db/migrate/")
    db_namespace["schema:dump"].invoke
  end
  namespace :test do
    desc "Prepare the test database"
    task :prepare do
      Environment.environment= 'test'
      Environment.connect_to_database
      file = ENV['SCHEMA'] || "db/schema.rb"
      if File.exists?(file)
        load(file)
      else
        abort %{#{file} doesn't exist yet. Run `rake db:migrate` to create it.}
      end
    end
  end
  desc 'Rolls the schema back to the previous version (specify steps w/ STEP=n).'
  task :rollback do
    Environment.environment = 'production'
    Environment.connect_to_database
    step = ENV['STEP'] ? ENV['STEP'].to_i : 1
    ActiveRecord::Migrator.rollback(ActiveRecord::Migrator.migrations_paths, step)
    db_namespace["schema:dump"].invoke
  end
  namespace :schema do
    desc 'Create a db/schema.rb file that can be portably used against any DB supported by AR'
    task :dump do
      require 'active_record/schema_dumper'
      Environment.environment = 'production'
      Environment.connect_to_database
      filename = ENV['SCHEMA'] || "db/schema.rb"
      File.open(filename, "w:utf-8") do |file|
        ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
      end
    end
  end
end

db_namespace = namespace :db do
  desc "Migrate the db"
  task :migrate do
    Environment.environment = 'production'
    Environment.connect_to_database
    ActiveRecord::Migrator.migrate("db/migrate/")
    db_namespace["schema:dump"].invoke
  end
end

def import_staples(db, env)
  CSV.foreach("./data/items.csv") do |row|
    `./ptickle add --name \"#{row[0]}\" --aisle #{row[2]} --environment #{env}`
  end
end

def import_purchases(db, env)
  CSV.foreach("./data/purchases.csv") do |row|
    `./ptickle set --name \"#{row[0]}\" --days #{row[1]} --environment #{env}`
  end
end
