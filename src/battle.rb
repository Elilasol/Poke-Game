class Battle
  
  def initialize(trainer_one, trainer_two)
    #puts trainer_one.name.chomp(" ") + " battles " + trainer_two.name.chomp(" ")
    @attack = {"Tackle" => "Attack", "Power" => 35, "Accuracy" => 95, "Type" => "Normal"}
    battle(trainer_one, trainer_two)
  end
  
  def battle(trainer_one, trainer_two)
    
    trainer_one_poke = trainer_one.pokemon[0]
    trainer_two_poke = trainer_two.pokemon[0]
    
    trainer_two = "Wild Pokemon"
    
    if trainer_two == "Wild Pokemon"
      trainer_two_poke = create_random_poke(random_wild_poke(route_decider(trainer_one)))
    end
    
    dead = false
    
    while dead == false
      
      first = trainer_one_poke
      first_trainer = trainer_one
      second = trainer_two_poke
      second_trainer = trainer_two
      
      if trainer_two_poke.speed > trainer_one_poke.speed
        first = trainer_two_poke
        first_trainer = trainer_two
        second = trainer_one_poke
        second_trainer = trainer_one
      end
      

      
      use_attack(first, second, "Tackle")
      
      if (second.check_dead == true)
        winner(first, second, first_trainer)
        dead = true
      else
        use_attack(second, first, "Tackle")
      end
      
      if (first.check_dead == true)
        winner(second, first, second_trainer)
        dead = true
      end
      
    end
    
  end
  
  def use_attack(attacking_poke, defending_poke, attack_name)
    attack_power = @attack["Power"]
    attack_accuracy = @attack["Accuracy"]
    #attack_type = @attack["Type"]
    
    attack_name = attack_name
    
    
    sametype = 1.5
    weakness = 1
    
    level = attacking_poke.level
    
    if attacking_poke.atk > attacking_poke.spatk
      attacking_type = "Normal"
    else
      attacking_type = "Special"
    end
    
    case attacking_type
      when "Normal"
      attack = attacking_poke.atk
      defense = defending_poke.def
    else
      attack = attacking_poke.spatk
      defense = defending_poke.spdef
    end
    
    random_flux = (((rand(15) + 1) + 85) / 100.0)
    
    if (rand(100) < attack_accuracy)
      damage = (((((2 * level / 5 + 2) * attack * attack_power / defense) / 50) + 2) * sametype * weakness * random_flux).to_i
      defending_poke.damage(damage)
    end
  end
  
  def route_decider(trainer)
    #trainer.pokemon[0].level will decide this, but for now, only route one is made.
    1
  end
  
  def random_wild_poke(route)
    # grab the route's pokemon and their rates and save them in a simpler hash
    pokemon_hash = {}
    random_poke_returned = Array.new
    
    case route
      when 1
      hash = ::ROUTE_1_HASH
    else
      puts "ERROR, NO ROUTE CHOSEN"
    end
    
    hash.each {|p| pokemon_hash[p[0]] = p[1]["RATE"]}
    
    # pick a random value from 1 to the size of the population
    population_size = pokemon_hash.each_value.inject(:+)
    random_value = rand(population_size) + 1
    
    # subtract from the random value until you reach zero or less and return
    # the name of the pokemon that wins
    random_poke_returned << pokemon_hash.each.find {|poke| (random_value -= poke[1]) <=0}[0]
    
    min = ::ROUTE_1_HASH[random_poke_returned[0]]["MIN"]
    max = ::ROUTE_1_HASH[random_poke_returned[0]]["MAX"]
    
    random_poke_returned << random_between(min, max)
  end
  
  def create_random_poke(poke_array)
    #pokemon_hash = Hash[ "POKEMON" => poke_array[0], "SEX" => random_sex(::POKEMON_HASH[poke_array[0]]["GENDER"]), "LEVEL" => poke_array[1], "EXP" => 0, "CURRENT_HP" => 1, "HP_IV" => rand(32), "ATK_IV" => rand(32), "DEF_IV" => rand(32), "SPATK_IV" => rand(32), "SPDEF_IV" => rand(32), "SPEED_IV" => rand(32), "HP_EV" => 0, "ATK_EV" => 0, "DEF_EV" => 0, "SPATK_EV" => 0, "SPDEF_EV" => 0, "SPEED_EV" => 0 ]
    Pokemon.new(poke_array[0], poke_array[1], "WILD")
  end
  
  def random_between(min, max)
    min + rand(max + 1 - min)
  end
  
  def winner(winner, loser, trainer)
    if winner.level < 100
      winner.exp_gain(loser, trainer)
    end
  end
  
end
