require 'optparse'

class Staple
  
  attr_accessor(:name, :days_stocked, :date) 

  def initialize (name, days_stocked, date_of_purchase)
    self.name = name
    self.days_stocked = days_stocked
    self.date = date_of_purchase
  end

  def self.add(options, db)
    db.execute("insert into staples ('name', 'targetInventory') values ('#{options[:name]}', #{options[:inv]})")  
    puts "Stub: You would have added something here."
  end

  def self.options_are_valid (options)
    if options.nil?
      return false
    else
      missing_arguments = []
      unless options[:name] 
        missing_arguments<< "item name" 
      end
      unless options[:inv]
        missing_arguments<< "target inventory amount"
      end
    end
    unless missing_arguments.empty? 
      puts "You must include "+missing_arguments.to_s+" when adding items."
      return false
    else return true
    end
  end

end