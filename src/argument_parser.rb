require 'getoptlong'

class ArgumentParser
  attr_reader :data_file, :words_to_generate
  
  def initialize(sex)
    @opts = GetoptLong.new(
      ["--datafile", "-d", GetoptLong::OPTIONAL_ARGUMENT],
      ["--number-of-words", "-n", GetoptLong::OPTIONAL_ARGUMENT]
    )
	if sex == "Male"
		@data_file = "files/etc/boy.txt"
	else @data_file = "files/etc/girl.txt"
	end 
    @words_to_generate = 1
  end

  def parse_arguments
    @opts.each do |opt, arg|
      case opt
      when '--datafile'
        @data_file = arg
      when '--number-of-words'
        @words_to_generate = arg
      end
    end
  end
  

#  def display_usage
#    puts "Sample usage:"
#    puts "ruby name_generator_main.rb -d <data-file>.txt -n <x>"
#    puts "<data-file>.txt is the name of a file with sample names to use as input"
#    puts "<x> -  the number of words to generate"
#    puts "both arguments are optional"
#  end
end
