require 'argument_parser'
require 'data_handler'
require 'name_generator'

class Name_Generator_Main

  def initialize
	argument_parser = ArgumentParser.new
	argument_parser.parse_arguments
	data_handler = DataHandler.new
	data_handler.read_data_file(argument_parser.data_file)
	name_generator = NameGenerator.new(data_handler.follower_letters)
	names = name_generator.generate_names(data_handler.start_pairs, argument_parser.words_to_generate)
	names.each {|name| puts name}

  end
end

