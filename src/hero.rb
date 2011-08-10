
require 'argument_parser'
require 'data_handler'
require 'name_generator'

class Hero

  def initialize
	@sex = random_sex(9)
	@name = random_name("@sex")
	@risky = random_personality_trait(4, 25)
	@int = random_personality_trait(4, 25)
	@pokemon = Array.new
	@pokemon << catch_initial_pokemon
	@badges = 0
	@decision = Hash["Random Battle", 1, "Heal", 0, "Random Catch", 0, "Fight Trainer", 0, "Fight Gym", 0, "EV Training", 0, "Aquiring Pokemon", 0, "Arena Fighting", 0, "Breeding", 0, "Relaxing", 0, "Reoganizing Pokemon Team", 0]
  end

  def catch_initial_pokemon
	random = rand(3)
		case random
			when 0 ; poke = "Bulbasaur"
			when 1 ; poke = "Charmander"
			when 2 ; poke = "Squirtle"
		end
	pokemon_hash = Hash[ "POKEMON" => poke, "SEX" => random_sex(0), "LEVEL" => 5, "EXP" => 0, "CURRENT_HP" => 1, "HP_IV" => rand(32), "ATK_IV" => rand(32), "DEF_IV" => rand(32), "SPATK_IV" => rand(32), "SPDEF_IV" => rand(32), "SPEED_IV" => rand(32), "HP_EV" => 0, "ATK_EV" => 0, "DEF_EV" => 0, "SPATK_EV" => 0, "SPDEF_EV" => 0, "SPEED_EV" => 0 ]
  end

  def random_sex(female_chance)
	if rand(20) <= female_chance
		"Female"
	else "Male"
	end
  end

  def random_name(sex)
	argument_parser = ArgumentParser.new(sex)
	argument_parser.parse_arguments
	data_handler = DataHandler.new
	data_handler.read_data_file(argument_parser.data_file)
	name_generator = NameGenerator.new(data_handler.follower_letters)
	name = name_generator.generate_names(data_handler.start_pairs, argument_parser.words_to_generate)
  end

  def random_personality_trait(numberof, die)
	numberof.times.inject(0) {|sum| rand(die) + sum}
  end

  def stat
	puts "#{@name}"
	puts "Risky level = #{@risky}"
	puts "Intelligence level = #{@int}"
	puts "#{@sex}"
	puts "#{@pokemon}"
	puts "#{@decision}"
  end

  def pokemon_hp
	@pokemon[0]["CURRENT_HP"]
  end

  def pokemon_hp_percent
	@pokemon[0]["CURRENT_HP"]
	name = @pokemon[0]["POKEMON"]
	base_hp = ::POKEMON_HASH[name]["HP"]
	hp_iv = @pokemon[0]["HP_IV"]
	level = @pokemon[0]["LEVEL"]

	current_max_hp = (((hp_iv + base_hp + 50) * level) / 50) + 10
	current_hp = @pokemon[0]["CURRENT_HP"] + 0.0
	percent_hp = current_hp / current_max_hp * 100	
  end

  def pokemon_max_hp
	@pokemon[0]["CURRENT_HP"]
	name = @pokemon[0]["POKEMON"]
	base_hp = ::POKEMON_HASH[name]["HP"]
	hp_iv = @pokemon[0]["HP_IV"]
	level = @pokemon[0]["LEVEL"]

	current_max_hp = (((hp_iv + base_hp + 50) * level) / 50) + 10
  end

  def pokemon
	@pokemon
  end

  def sex
	@sex
  end

  def name
	@name
  end

  def risky
	@risky
  end

  def int
	@int
  end

  def decision
	@decision
  end

end
