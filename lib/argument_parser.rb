require 'optparse'

class ArgumentParser

  def self.parse

    options = {}
    OptionParser.new do |opts|
      opts.banner = "Usage: ptickle [command] [options]"
      opts.on("--inv [INV]", "Target inventory amount") do |inv|
        options[:inv] = inv
      end
      opts.on("--name [NAME]", "Inventory Item Name") do |name|
        options[:name] = name
      end
      opts.on("--environment [ENV]", "Active Environment") do |env|
        options[:environment] = env 
      end
      opts.on("--days [days]", "Days stocked of item") do |days|
        options[:days_stocked] = days
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