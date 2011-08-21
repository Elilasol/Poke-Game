class Pokemon

  # class variables / methods
  
  @@base_stats = ::POKEMON_HASH

  def self.random_sex(type)
    rand(20) <= 0 ? "Female" : "Male"
	end


  # instance methods

  def initialize(type)
    # raise an error if this is an invalid pokemon type
    raise unless @@base_stats[type]

    @type = type
    @sex = Pokemon.random_sex(type)
    @level = 5
    @experience = 0
    @damage => 0 
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
    (((ivs[:hp] + gtype["HP"] + evs[:hp] + 50) * @level) / 50) + 10
  end

  def hp_percent
    1.0 - (@damage.to_f / max_hp)
  end

  # dynamic code to be entered here for the various stats to point to #generic_stat

  def generic_stat(stat_name)
    stat_string = stat_name.to_s.upcase

    (((ivs[stat_name] + gtype[stat_string] + (evs[stat_name / 8)) * @level) / 50)
  end


  private

  # pokemon genotype shortcut
  def gtype
    @@base_stats[@type]
  end

end
