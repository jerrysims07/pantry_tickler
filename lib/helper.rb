def add_staple(options, db)
  db.execute("insert into staples ('name', 'targetInventory') values ('#{options[:name]}', #{options[:inv]})")  
  puts "Stub: You would have added something here."
end

def add_staple (options, database)
  if Staple.options_are_valid options
    result =  Staple.add(options, database)
    puts result
  end
end

def add_purchase (options, database)
  if Purchase.options_are_valid options
    Purchase.add(options, database)
  end
end

# def set_inventory (options, database)
#   if Staple.options_are_valid options
#     Staple.search options[:name]
#     Staple.confirm_search_result 
#     Staple.update
#   end
# end 

def set_inventory (options, database)
  if Staple.options_are_valid options
    Staple.set(options, database)
  end
end

def print_grocery_list (options, database)
  if Staple.options_are_valid options
    Staple.print_grocery_list(options, database)
  end
end

def delete_item (options, database)
  if(Staple.options_are_valid options)
    Staple.delete(options, database)
  end 
end

def update_inventory(options, database)
  if(Staple.options_are_valid options)
    Staple.inventory(options, database)
  end 
end

def import_purchases(options, database)
  if(Staple.options_are_valid options)
    Staple.import(options, database)
  end 
end

def execute_the_command(options, database)
  case options[:command]
  when "add"
    add_staple(options, database)
  when "purchase"
    add_purchase(options, database)
  when "set"
    set_inventory(options, database)
  when "print"
    print_grocery_list(options, database)
  when "delete"
    delete_item(options, database)
  when "inventory"
    update_inventory(options, database)
  when "import"
    import_purchases(options, database)
  else puts "command not found"
  end  
end

