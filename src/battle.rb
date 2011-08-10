class Battle

  def initialize(trainer_one, trainer_two)
	puts trainer_one.name.chomp(" ") + " battles " + trainer_two.name.chomp(" ")
	battle(trainer_one, trainer_two)
  end

  def battle(trainer_one, trainer_two)
	puts trainer_one.name.chomp(" ") + " wins!"
	
	if trainer_one.pokemon[0]["LEVEL"] < 100
		trainer_one.pokemon[0]["LEVEL"] += 1
	end
  end
end
