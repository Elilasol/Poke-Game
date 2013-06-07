require 'pokemon_hash'

class Route
  attr_accessor :size_info, :name
  
  def initialize(file)
    
    @name = ""
    @minlevel = 100
    @maxlevel = 0
    @pokemon = Hash.new
    @size_info = nil
    
    load_data(file)
    
  end

  def is_mouse_hovering(mx, my)    

    #puts "(#{mx} #{my}) (#{@size_info["LEFT"]} #{@size_info["TOP"]} #{@size_info["RIGHT"]} #{@size_info["BOTTOM"]})"
    (mx > @size_info["LEFT"] and my > @size_info["TOP"]) and (mx < @size_info["RIGHT"] and my < @size_info["BOTTOM"])
    
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
    @size_info = @pokemon.delete("Rectangle")
    
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
  
  def display_name
    @name.split('_').map(&:capitalize).join(' ')
  end
  
  def maxlevel
    @maxlevel
  end
  
  def minlevel
    @minlevel
  end
  
end
