require 'active_record'
require 'optparse'
require 'date'
require 'csv'

class Staple < ActiveRecord::Base
  
  default_scope { order("name ASC") }

  # attr_accessor(:name, :days_stocked, :date)


  # def initialize (name, days_stocked, date_of_purchase)
  #   self.name = name
  #   self.days_stocked = days_stocked
  #   self.date = date_of_purchase
  #   valid_options => {:set_options= [name, days, date]}
  # end

  # def self.valid_options
  # end

  def self.search(search_term = nil)
    Staple.where("name LIKE ?", "%#{search_term}%").to_a
  end

  def self.add(options, db)

    #look for the item that was entered and return with appropriate message if that item is found. 
    # already_exists = db.execute("select name from staples where name = '#{options[:name]}'")
    already_exists = Staple.find_by(name: options[:name])
    return "That item already exists. Use the 'edit' command to change" if already_exists

    #create the item
    # db.execute("insert into staples ('name','aisle') values ('#{options[:name]}', #{options[:aisle]})")  
    new_item = Staple.create(name: options[:name], aisle: options[:aisle])
    return "You have added the following:\nname: #{options[:name]}, aisle: #{options[:aisle]}"
  end

  def self.options_are_valid (options)
    valid_options = { "add" => {:name => "item name", 
                                :aisle => "aisle"}, 
                      "set" => {:name => "item name", 
                                :days_stocked => "days stocked"}, 
                      "print" => {:shopping_days => "shopping day count"},
                      "delete" => {:name => "item name"},
                      "import" => {:filename => "purchase file to be imported"},
                      "inventory" => {:filename => "inventory file"}} 
    return false if options.nil?
    missing_arguments = []
    valid_options[options[:command]].each_pair do |opt, err|
      unless options[opt] 
        missing_arguments << err 
      end       
    end
    unless missing_arguments.empty? 
      puts "You must include "+missing_arguments.to_s+" with the #{options[:command]} command."
      return false
    else return true
    end
  end

  def self.set(options, db)
    # results = search(options, db)
    results = Staple.where(name: options[name])
    if results.empty? 
      puts "No results were returned." 
      return
    else
      #calculate the new date

      # update the item to the new values sent in
      results.update(name: options[:name], aisle: options[:aisle], next_purchase_date: self.get_target_date(options[:days_stocked]))
      results.name
      # db.execute("UPDATE staples SET nextPurchaseDate=date('now','+#{options[:days_stocked]} days') WHERE name = \'#{options[:name]}\'")
      new_row = db.execute("select name, nextPurchaseDate from staples where name = '#{options[:name]}'")
      puts "#{results.name}  is now scheduled to be purchased on #{results.next_purchase_date}."
    end
  end

  def self.print(row)
    puts row.to_s
  end

  def self.search(options,db)
    # results = db.execute("select name, nextPurchaseDate from staples where name like '%#{options[:name]}%'")
  end

  def self.print_grocery_list (options, database)
    target_date = get_target_date(options[:shopping_days].to_i)
    results = Staple.all#("next_purchase_date < #{target_date}")
    # results = database.execute("select name, aisle from staples where nextPurchaseDate < \'#{target_date}\' order by aisle ASC")
    printf("%22s%10s\n","Item Name","Aisle")
    printf("%22s%10s\n","---------","-----")
    puts "No items matched your query" if results.empty?
    results.map do |result| 
      # puts "#{result[0]}      #{result[1]}" 
      printf("%22s%8s\n", result.name,result.aisle) 
    end 
  end

  def self.get_target_date (x)
    return (Time.now + x * (24*60*60)).strftime("%Y-%m-%d")
  end

  def self.delete (options, db)
    results = Staple.find_by(name: options[:name])
    if results.nil? 
      puts "That item was not found" 
      return
    else
      results.destroy
      # db.execute("delete from staples WHERE name = \'#{options[:name]}\'")
      puts "You have deleted \'#{options[:name]}\' from the database."
    end
  end

  def self.import(options, db)
    CSV.foreach(options[:filename]) do |row|
      `./ptickle purchase --name \"#{row[0]}\" --days #{row[1]} --environment #{options[:environment]}`
    end
    puts "File imported successfully"
  end

  def self.inventory(options, db)
    CSV.foreach(options[:filename]) do |row|
      `./ptickle set --name \"#{row[0]}\" --days #{row[1]} --environment #{options[:environment]}`
    end
    puts "File imported successfully"

  end

end