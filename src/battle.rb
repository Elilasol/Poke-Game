class Battle

  def initialize(trainer_one, trainer_two)
	#puts trainer_one.name.chomp(" ") + " battles " + trainer_two.name.chomp(" ")
	@attack = {"Tackle" => "Attack", "Power" => 35, "Accuracy" => 95, "Type" => "Normal"}
	battle(trainer_one, trainer_two)
  end

  def battle(trainer_one, trainer_two)

	trainer_one_poke = trainer_one.pokemon(0)
	trainer_two_poke = trainer_two.pokemon(0)

	dead = false
	trainer_one_poke["CURRENT_HP"] = stat_calc(trainer_one_poke, "HP")
	trainer_two_poke["CURRENT_HP"] = stat_calc(trainer_two_poke, "HP")
	
	while dead == false

		first = trainer_one_poke
		second = trainer_two_poke

		if stat_calc(trainer_two_poke, "SPEED") > stat_calc(trainer_one_poke, "SPEED")
			first = trainer_two_poke
			second = trainer_one_poke
		end

		use_attack(first, second, attack = "Tackle")
		
		if second["CURRENT_HP"] <= 0
			second["CURRENT_HP"] = 0
			dead = true
			puts second["POKEMON"] + " dies!"
			winner(first)
		end
	
		if dead != true
			use_attack(second, first, attack = "Tackle")

			if first["CURRENT_HP"] <= 0
				first["CURRENT_HP"] = 0
				dead = true
				puts first["POKEMON"] + " dies!"
				winner(second)
			end
		end
	end

  end

  def use_attack(attacking_poke, defending_poke, attack_name)
	attack_power = @attack["Power"]
	attack_accuracy = @attack["Accuracy"]
	attack_type = @attack["Type"]
	
	sametype = 1.5
	weakness = 1
	
	level = attacking_poke["LEVEL"]
	
	if stat_calc(attacking_poke, "ATK") > stat_calc(attacking_poke, "SPATK")
		attacking_type = "Normal"
	else
		attacking_type = "Special"
	end

	case attacking_type
		when "Normal"
			attack = stat_calc(attacking_poke, "ATK")
			defense = stat_calc(defending_poke, "DEF")
		else 
			attack = stat_calc(attacking_poke, "SPATK")
			defense = stat_calc(defending_poke, "SPDEF")
	end

	random_flux = (((rand(15) + 1) + 85) / 100.0)
	
	if (rand(100) < attack_accuracy)	
		damage = (((((2 * level / 5 + 2) * attack * attack_power / defense) / 50) + 2) * sametype * weakness * random_flux).to_i
		defending_poke["CURRENT_HP"] -= damage
	end
  end

  def stat_calc(poke, stat)

	case stat
		when "HP"
			name = poke["POKEMON"]
			base_hp = ::POKEMON_HASH[name]["HP"]
			hp_iv = poke["HP_IV"]
			level = poke["LEVEL"]
			ev = 0

			stat = (((hp_iv + base_hp + ev + 50) * level) / 50) + 10

		when "HP_PERCENT"
			name = poke["POKEMON"]
			base_hp = ::POKEMON_HASH[name]["HP"]
			hp_iv = poke["HP_IV"]
			level = poke["LEVEL"]
			ev = 0

			max_hp = (((hp_iv + base_hp + ev + 50) * level) / 50) + 10
			current_hp = poke["CURRENT_HP"] + 0.0

			stat = current_hp / current_max_hp * 100	

		else
			name = poke["POKEMON"]
			base_stat = ::POKEMON_HASH[name][stat]
			stat_iv = poke[stat + "_IV"]
			level = poke["LEVEL"]
			ev = 0

			stat = (((stat_iv + base_stat + (ev / 8)) * level) / 50)
	end

	stat
  end

  def winner(poke)
	if poke["LEVEL"] < 100
		poke["LEVEL"] += 1
	end
	puts poke["POKEMON"] + " wins!"
	puts poke
  end

end
