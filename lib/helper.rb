def add_staple(options, db)
  db.execute("insert into staples ('name', 'targetInventory') values ('#{options[:name]}', #{options[:inv]})")  
  puts "Stub: You would have added something here."
end

def addStaple (options, database)
  if Staple.options_are_valid options
    Staple.add(options, database)
  end
end

def addPurchase (options, database)
  if Purchase.options_are_valid options
    Purchase.add(options, database)
  end
end