require 'optparse'

class ParseArgv

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
    end.parse!
    options
  end

  def self.validate options
    errors = []
    if options[:name].nil? or options[:name].empty?
      errors << "You must provide the name of the product you are adding.\n"
    end

    missing_vars = []
    missing_vars << "target inventory amount" unless options[:inv]
    unless missing_vars.empty?
      errors << "You must include #{missing_vars.join(" and ")} when adding items.\n"
    end
    errors
  end
end