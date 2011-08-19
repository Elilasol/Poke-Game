class Stat_calc

  def initialize(poke, stat)

	case stat
		when "HP"
			name = poke["POKEMON"]
			base_hp = ::POKEMON_HASH[name]["HP"]
			hp_iv = poke["HP_IV"]
			level = poke["LEVEL"]
			ev = 0

			@stat = (((hp_iv + base_hp + ev + 50) * level) / 50) + 10

		when "HP_PERCENT"
			name = poke["POKEMON"]
			base_hp = ::POKEMON_HASH[name]["HP"]
			hp_iv = poke["HP_IV"]
			level = poke["LEVEL"]
			ev = 0

			max_hp = (((hp_iv + base_hp + ev + 50) * level) / 50) + 10
			current_hp = poke["CURRENT_HP"] + 0.0

			@stat = current_hp / current_max_hp * 100	

		else
			name = poke["POKEMON"]
			base_stat = ::POKEMON_HASH[name][stat]
			stat_iv = poke[stat + "_IV"]
			level = poke["LEVEL"]
			ev = 0

			@stat = (((stat_iv + base_stat + (ev / 8)) * level) / 50)
	end

	stat
  end

  def stat
	@stat
  end
end