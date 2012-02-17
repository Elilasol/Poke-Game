class Decision_Tree

#::TRAINER_HASH.each do |t|
#puts t[1]["NAME"]

  def initialize(hero)

	decide(hero)
	perform(hero)
  end

  def perform(hero)

	decision_levels = nil

	i = 7
	while decision_levels == nil do

		decision_levels_check = hero.decision.select{|k, v| v == i}
		if decision_levels_check.length >= 1
			decision_levels = decision_levels_check
		end
		i -= 1
	end

	if decision_levels.length > 1
		perform_action(dilemma(decision_levels), hero)
	else perform_action(decision_levels.keys[0].to_s, hero)
	end

  end

  def perform_action(action, hero)
	puts action + " is being performed by " + hero.name

	case action
		when "Heal"
			hero.pokemon[0]["CURRENT_HP"] = hero.pokemon_max_hp
			hero.decision["Relaxing"] = 0
			hero.decision["Random Battle"] = 3
			
		when "Fight Gym"
			puts "Fighting a Gym for a badge attempt."
			hero.decision["Relaxing"] += 3
		when "Aquiring Pokemon"
			puts "Locating and catching a pokemon."
			hero.decision["Relaxing"] += 1
		when "EV Training"
			puts "Training thier pokemon to be the best!"
			hero.decision["Relaxing"] += 1
		when "Arena Fighting"
			puts "Battling in the arena matches!"
			hero.decision["Relaxing"] += 2
		when "Reorganizing Pokemon Team"
			puts "Switching thier pokemon around."
			hero.decision["Relaxing"] += 1
		when "Relaxing"
			puts "Taking a break and resting"
			hero.decision["Relaxing"] = 0
		when "Random Battle"
			puts "Fighting in a random battle!"
			hero.pokemon[0]["CURRENT_HP"] -= (0.1 * hero.pokemon_max_hp).to_i
			hero.decision["Relaxing"] += 1
	end
		
  end

  def dilemma(decision_levels)

	dilemma_decision = decision_levels.keys[0]

	1.upto(decision_levels.length) do |i|
		if ::DECISION_IMPORTANCE[decision_levels.keys[i].to_s].to_i > ::DECISION_IMPORTANCE[dilemma_decision.to_s].to_i
			dilemma_decision = decision_levels.keys[i]
		end
	end
	
	dilemma_decision
  end

  def decide(hero)
	hero.decision.merge!(pokemon_status(hero))
  end

  def pokemon_status(hero)

	percent = hero.pokemon_hp_percent
	risky = hero.risky - 50
	hero_opinion = (percent * (1 + (risky / 100.0)))

	heal_hash = Hash.new

	if percent < 100

		case hero_opinion 
			when 85..100
				heal_hash["Heal"] = 1
			when 70..84
				heal_hash["Heal"] = 2
			when 55..69
				heal_hash["Heal"] = 3
			when 45..54
				heal_hash["Heal"] = 4
			when 30..44
				heal_hash["Heal"] = 5
			when 15..29
				heal_hash["Heal"] = 6
			when 0..14
				heal_hash["Heal"] = 7	
		end

	else heal_hash["Heal"] = 0
	end

	heal_hash

  end

  def pokemon_hp_percent(hero)

	name = hero.pokemon[0]["POKEMON"]
	base_hp = ::POKEMON_HASH[name]["HP"]
	hp_iv = hero.pokemon[0]["HP_IV"]
	level = hero.pokemon[0]["LEVEL"]

	current_max_hp = (((hp_iv + base_hp + 50) * level) / 50) + 10
	current_hp = hero.pokemon[0]["CURRENT_HP"] + 0.0
	percent_hp = current_hp / current_max_hp * 100	
  end

end