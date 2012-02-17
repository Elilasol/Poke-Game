class Battle
  
  def initialize(trainer_one, trainer_two)
    @island = trainer_one.island
    @attack = {"Tackle" => "Attack", "Power" => 35, "Accuracy" => 95, "Type" => "Normal"}
    battle(trainer_one, trainer_two)
  end
  
  def battle(trainer_one, trainer_two)
    
    trainer_one_poke = trainer_one.pokemon[0]
    
    if trainer_two == "Wild Pokemon"
      trainer_two_poke = create_random_poke(random_wild_poke(route_decider(trainer_one)))
    else
      trainer_two_poke = trainer_two.pokemon[0]
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
    if attacking_poke.owner == "WILD"
      attack_accuracy *= 0.5
    end
    
    attack_type_1 = ::POKEMON_HASH[attacking_poke.name]["TYPE1"]
    attack_type_2 = ::POKEMON_HASH[attacking_poke.name]["TYPE2"]
    
    attack_name = attack_name
    
    sametype = 1.5
    weakness_vs_1 = weakness_check(attack_type_1, defending_poke)
    weakness = weakness_vs_1
    
    if attack_type_2 != nil
      weakness_vs_2 = weakness_check(attack_type_2, defending_poke)
      if weakness_vs_2 > weakness_vs_1
        weakness = weakness_vs_2
      end
    end
    
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
    
    damage = 0
    
    if (rand(100) < attack_accuracy)
      damage = (((((2 * level / 5 + 2) * attack * attack_power / defense) / 50) + 2) * sametype * weakness * random_flux).to_i
      defending_poke.damage(damage)
    end
  end
  
  def route_decider(trainer)
    #trainer.pokemon[0].level will decide this, but for now, only route 1-3 and viridian are made.
    
    max_fight = trainer.pokemon[0].level
    max_fight *= trainer.risk_mod
    
    route_choice = @island.route("route_1")
    
    @island.routes.each do |route|
      if (route.maxlevel <= max_fight) && (route_choice.maxlevel <= route.maxlevel)
        route_choice = route
      end
    end
    route_choice
  end
  
  def weakness_check(type, enemy)
    weakness_one = ::TYPE_HASH[type][::POKEMON_HASH[enemy.name]["TYPE1"]]
    weakness_two = ::TYPE_HASH[type][::POKEMON_HASH[enemy.name]["TYPE2"]]
    
    if weakness_two != nil
     (weakness_one / 100.0) * (weakness_two / 100.0)
    else
      weakness_one / 100.0
    end
    
  end
  
  def random_wild_poke(route)
    # grab the route's pokemon and their rates and save them in a simpler hash
    pokemon_hash = {}
    random_poke_returned = Array.new
    
    hash = route.pokemon
    
    hash.each {|p| pokemon_hash[p[0]] = p[1]["RATE"]}
    
    # pick a random value from 1 to the size of the population
    population_size = pokemon_hash.each_value.inject(:+)
    random_value = rand(population_size) + 1
    
    # subtract from the random value until you reach zero or less and return
    # the name of the pokemon that wins
    random_poke_returned << pokemon_hash.each.find {|poke| (random_value -= poke[1]) <=0}[0]
    
    min = hash[random_poke_returned[0]]["MIN"]
    max = hash[random_poke_returned[0]]["MAX"]
    
    random_poke_returned << random_between(min, max)
  end
  
  def create_random_poke(poke_array)
    Pokemon.new(poke_array[0], poke_array[1], "WILD")
  end
  
  def random_between(min, max)
    min + rand(max + 1 - min).to_i
  end
  
  def winner(winner, loser, trainer)
    if winner.level < 100
      winner.exp_gain(loser, trainer)
      case winner.name
        when "Bulbasaur"
        when "Charmander"
        when "Squirtle"
        when "Ivysaur"
        when "Venusaur"
        when "Charmeleon"
        when "Charizard"
        when "Wartortle"
        when "Blastoise"
      else
        puts winner.name + " level " + winner.level.to_s + " defeated " + loser.name + " level " + loser.level.to_s
      end
    end
  end
  
end
