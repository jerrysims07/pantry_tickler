
class Purchase
  
  attr_accessor(:name, :days_stocked, :date) 

  def initialize (name, days_stocked, date_of_purchase)
    self.name = name
    self.days_stocked = days_stocked
    self.date = date_of_purchase
  end

  def self.add(options, db)
    db.execute("insert into purchases ('name', 'daysStocked') values ('#{options[:name]}', #{options[:days_stocked]})")
    puts "You have added the following purchase:\nname: #{options[:name]}, days stocked: #{options[:days_stocked]}"
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