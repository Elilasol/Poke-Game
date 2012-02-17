class Pokemon
  
  def self.random_sex(chance)
    case chance
      when -1
      female_chance = -1
      when 0
      female_chance = 0
      when 1
      female_chance = 5
      when 2
      female_chance = 25
      when 4
      female_chance = 50
      when 6
      female_chance = 75
      when 8
      female_chance = 100
    end
    
    if female_chance != -1
      rand(100 + 1) <= female_chance ? "Female" : "Male"
    else "Genderless"
    end
  end
  
  def self.stat_definition(name)
    define_method(name) {
      generic_stat("#{name}".to_sym)
    }
  end
  
  # instance methods
  
  def initialize(type, level, owner)
    
    # class variables / methods
    
    @@base_stats = ::POKEMON_HASH
    
    # raise an error if this is an invalid pokemon type
    raise unless @@base_stats[type]
    
    @type = type
    @owner = owner
    @sex = Pokemon.random_sex(@@base_stats[type]["GENDER"])
    @level = level
    @experience = exp_to(level)
    @damage = 0
    @ivs = { :hp => rand(32),
             :atk => rand(32),
             :def => rand(32),
             :spatk => rand(32),
             :spdef => rand(32),
             :speed => rand(32) }
    @evs = { :hp => 0,
             :atk => 0,
             :def => 0,
             :spatk => 0,
             :spdef => 0,
             :speed => 0 }
  end
  
  def max_hp
   (((@ivs[:hp] + gtype["HP"] + @evs[:hp] + 50) * @level) / 50) + 10
  end
  
  def heal
    @damage = 0
  end
  
  def ivs
    @ivs
  end
  
  def owner
    @owner
  end
  
  def name
    @type
  end
  
  def check_dead
    if @damage >= max_hp
      @damage = max_hp
      true
    end
  end
  
  def exp
    @experience
  end
  
  def level
    @level
  end
  
  def exp_gain(defeated_pokemon, owner)
    wild = ((defeated_pokemon.owner == "WILD")? 1 : 1.5)
    owner_check = ((self.owner == owner)? 1 : 1.5)
    lucky_egg = 1
    base_exp = @@base_stats[defeated_pokemon.name]["BASEXP"]
    defeated_level = defeated_pokemon.level
    participants = 1
    
    @experience += ((wild * owner_check * lucky_egg * base_exp * defeated_level) / 7 * participants).to_i
    
    self.check_level    
  end
  
  def check_level
    if @experience > exp_to(self.level + 1)
      @level += 1
      self.check_evolve
    end
  end
  
  def check_evolve
    evolve_trig = @@base_stats[@type]["EVOL_TRIG"]
    
    case evolve_trig
      when 1
      #level evolution
      evol_level = @@base_stats[@type]["EVOL_LEVEL"]
      evol_to = find_by_id(@@base_stats[@type]["EVOL_TO"])
      
      if @level == evol_level
        puts @type.to_s + " evolves to " + evol_to
        if @owner != "WILD"
          puts @owner.risk_mod
        end
        @type = evol_to
      end
      when 2
      #trade
      when 3
      #use item on poke
    end
  end
  
  def find_by_id(poke_id)
    name = ""
    @@base_stats.each do |i|
      if i[1]["DEX"] == poke_id
        name = i[0]
      end
    end
    name
  end
  
  
  def exp_to(level)
    growth = @@base_stats[@type]["GROWTH"]
    next_level = level
    squared = next_level * next_level
    cubed = squared * next_level
    
    case growth
      when 1
       ((5 * cubed) / 4.0).to_i
      when 2
      cubed
      when 3
       ((4 * cubed) / 5.0).to_i
      when 4
       ((6 / 5.0 * cubed) - (15 * squared) + (100 * next_level) - 140).to_i
    end
  end
  
  def damage(incoming)
    @damage += incoming
  end
  
  def hp_percent
    1.0 - (@damage.to_f / max_hp)
  end
  
  def hp
    current_hp = max_hp - @damage
    current_hp > 0 ? current_hp : 0
  end
  
  stat_definition :atk
  stat_definition :def
  stat_definition :spatk
  stat_definition :spdef
  stat_definition :speed
  
  private
  
  def generic_stat(stat_name)
    stat_string = stat_name.to_s.upcase
    
     (((@ivs[stat_name] + gtype[stat_string] + (@evs[stat_name] / 8)) * @level) / 50)
  end
  
  # pokemon genotype shortcut
  def gtype
    @@base_stats[@type]
  end
  
end
