require 'date'

class Purchase
  
  attr_accessor(:name, :days_stocked, :date) 

  def initialize (name, days_stocked, date_of_purchase)
    self.name = name
    self.days_stocked = days_stocked
    self.date = date_of_purchase
  end

  def self.add(options, db)
    results = Staple.find_by(name: options[:name])
    if results.nil? 
      puts "No results were returned." 
      return
    else
      return_row = Staple.find_by(name: options[:name])
      # return_row = db.execute("select * from staples where name = \'#{options[:name]}\'")
      if return_row.nil?
        new_date = (Time.now + options[:days_stocked].to_i*(24*60*60)).strftime("%Y-%m-%d")
      else
        new_date = Date.strptime(return_row.next_purchase_date,"%Y-%m-%d") + options[:days_stocked].to_i
      end
      staple = Staple.find_by(name: options[:name])
      staple.update(nextPurchaseDate: new_date)      
      # db.execute("UPDATE staples SET nextPurchaseDate=#{new_date} where name = \'#{options[:name]}\'")
      puts "#{options[:name]} is now scheduled to be purchased on #{new_date}."  
    end
  end

  def self.options_are_valid options
  end

  def self.options_are_valid (options)
  if options.nil?
    return false
  else
    missing_arguments = []
    unless options[:name] 
      missing_arguments<< "item name" 
    end
    unless options[:days_stocked]
      missing_arguments<< "days stocked"
    end
  end
  unless missing_arguments.empty? 
    puts "You must include "+missing_arguments.to_s+" when adding purchases."
    return false
  else return true
  end
end



end