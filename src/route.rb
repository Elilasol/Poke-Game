require 'pokemon_hash'

class Route
  
  def initialize(file)
    
    @name = ""
    @minlevel = 100
    @maxlevel = 0
    @size = 0
    @pokemon = Hash.new
    
    load_data(file)
    
  end
  
  def stat
    puts @name
    puts @minlevel
    puts @maxlevel
    puts @pokemon
  end
  
  def load_data(file)
    @name = File.basename(file.chomp(".txt"))
    @pokemon = Pokemon_Hash.read(file)
    
    load_levels
  end
  
  def load_levels
    @pokemon.each do |poke|
      if poke[1]["MAX"] > @maxlevel
        @maxlevel = poke[1]["MAX"] 
      end
      if poke[1]["MIN"] < @minlevel
        @minlevel = poke[1]["MIN"] 
      end
    end
  end
  
  def pokemon
    @pokemon
  end
  
  def name
    @name
  end
  
  def maxlevel
    @maxlevel
  end
  
  def minlevel
    @minlevel
  end
  
end