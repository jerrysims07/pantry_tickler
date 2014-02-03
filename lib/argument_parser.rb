require 'optparse'

class ArgumentParser

  def self.parse

    options = {}
    OptionParser.new do |opts|
      opts.banner = "Usage: ptickle [command] [options]"
      opts.on("--name [NAME]", "Inventory Item Name") do |name|
        options[:name] = name
      end
      opts.on("--environment [ENV]", "Active Environment") do |env|
        options[:environment] = env 
      end
      opts.on("--days [days]", "Days stocked of item") do |days|
        options[:days_stocked] = days
      end
      opts.on("--shopping_days [days]", "Number of shopping days") do |days|
        options[:shopping_days] = days
      end
      opts.on("--aisle [aisle]", "Aisle") do |aisle|
        options[:aisle] = aisle
      end
    end.parse!
    options
  end

  def self.validate options
    errors = []
    if options[:name].nil? or options[:name].empty?
      errors << "You must provide the name of the product.\n"
    end
    errors
  end
end