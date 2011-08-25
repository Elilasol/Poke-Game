class Decision_Tree

#::TRAINER_HASH.each do |t|
#puts t[1]["NAME"]

  def initialize(trainer, trainer_array)
	@trainers = trainer_array

	decide(trainer)
	perform(trainer)
  end

  def perform(trainer)

	decision_levels = nil

	i = 7
	while decision_levels == nil do

		decision_levels_check = trainer.decision.select{|k, v| v == i}
		if decision_levels_check.length >= 1
			decision_levels = decision_levels_check
		end
		i -= 1
	end

	if decision_levels.length > 1
		perform_action(dilemma(decision_levels), trainer)
	else perform_action(decision_levels.keys[0].to_s, trainer)
	end

  end

  def perform_action(action, trainer)
	#puts action + " is being performed by " + trainer.name

	case action
		when "Heal"
			trainer.current_action_set(trainer.name.to_s + " healing their pokemon.")
			trainer.pokemon[0].heal
			trainer.decision["Relaxing"] = 0
			trainer.decision["Random Battle"] = 3
			
		when "Fight Gym"
			trainer.current_action_set(trainer.name.to_s + " fighting a gym for a badge.")
			trainer.decision["Relaxing"] += 3

		when "Aquiring Pokemon"
			trainer.current_action_set(trainer.name.to_s + " Locating and catching a pokemon.")
			trainer.decision["Relaxing"] += 1

		when "EV Training"
			trainer.current_action_set(trainer.name.to_s + " Training thier pokemon to be the best!")
			trainer.decision["Relaxing"] += 1

		when "Arena Fighting"
			trainer.current_action_set(trainer.name.to_s + " Battling in the arena matches!")
			trainer.decision["Relaxing"] += 2

		when "Reorganizing Pokemon Team"
			trainer.current_action_set(trainer.name.to_s + " Switching thier pokemon around.")
			trainer.decision["Relaxing"] += 1

		when "Relaxing"
			trainer.current_action_set(trainer.name.to_s + " Taking a break and resting")
			trainer.decision["Relaxing"] = 0

		when "Random Battle"
			trainer.current_action_set(trainer.name.to_s + " Fighting in a random battle!")
			Battle.new(trainer, @trainers[rand(3)])
			trainer.decision["Relaxing"] += 1
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

  def decide(trainer)
	trainer.decision.merge!(pokemon_status(trainer))
  end

  def pokemon_status(trainer)

	percent = trainer.pokemon[0].hp_percent * 100
	risky = trainer.risky - 50
	trainer_opinion = (percent * (1 + (risky / 100.0)))

	heal_hash = Hash.new

	if percent < 100

		case trainer_opinion 
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

end