
require 'argument_parser'
require 'data_handler'
require 'name_generator'
require 'pokemon'

class Trainer
  attr_accessor :sex, :island, :route, :name, :int, :pokemon,
  :badges, :current_action, :decision, :average_level, :average_iv,
  :top_iv
  
  def initialize(island)
    
    @sex = random_sex(50)
    @island = island
    @route = "route_1"
    @average_level = 5
    @average_iv = 0
    @top_iv = 0
    
    @name = random_name("@sex")
    @risky = random_personality_trait(4, 25)
    @int = random_personality_trait(4, 25)
    @pokemon = Array.new
    @pokemon << catch_initial_pokemon(self)
    @badges = 0
    @current_action = "No action decided upon yet."
    @decision = Hash["Random Battle", 1, "Heal", 0, "Random Catch", 0, "Fight Trainer", 0, "Fight Gym", 0, "EV Training", 0, "Aquiring Pokemon", 0, "Arena Fighting", 0, "Breeding", 0, "Relaxing", 0, "Reoganizing Pokemon Team", 0]
  end
  
  def random_sex(female_chance)
    rand(100) < female_chance ? "Female" : "Male"
  end

  def calculate_averages
    total_level = 0
    average_iv = 0
    top_iv = 0
    
    @pokemon.each do |pokemon|
      total_level += pokemon.level
      average_iv += pokemon.average_iv
      if top_iv < pokemon.average_iv
        top_iv = pokemon.average_iv
      end
    end

    @average_level = (total_level / pokemon.size).to_f
    @average_iv = (average_iv / pokemon.size).to_f
    @top_iv = top_iv
  end
  
  def catch_initial_pokemon(owner)
    poke = ""
    random = rand(3)
    case random
      when 0
      poke = "Bulbasaur"
      when 1
      poke = "Charmander"
      when 2
      poke = "Squirtle"
    end
    Pokemon.new(poke, 5, owner)
    #self.calculate_averages
  end
  
  def random_name(sex)
    argument_parser = ArgumentParser.new(sex)
    argument_parser.parse_arguments
    data_handler = DataHandler.new
    data_handler.read_data_file(argument_parser.data_file)
    name_generator = NameGenerator.new(data_handler.follower_letters)
    name_generator.generate_names(data_handler.start_pairs, argument_parser.words_to_generate)
  end
  
  def random_personality_trait(numberof, die)
    numberof.times.inject(0) {|sum| rand(die) + sum}
  end
  
  def stat
    
    puts "#{@name}"
    puts "Risky level = #{@risky}"
    puts "Intelligence level = #{@int}"
    puts "#{@sex}"
    puts "#{@pokemon.first.name}"
    puts "#{@decision}"
  end
  
  def current_action_set(message)
    @current_action = message
  end
  
  def name
    @name.chomp(" ")
  end
  
  def risk_mod
    risky = @risky - 50
    (1 + (risky / 100.0))
  end
  
end
