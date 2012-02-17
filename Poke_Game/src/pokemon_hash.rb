require 'yaml'

=begin
  * Name: CreatureGenerator
  * Description
       Reads a YAML creature definition file, and creates some hash with
       each kind of creature as a hash; is able to create the actual
       Creature objects and return them 
  * Author: elKano
  * Date: 13-02-06
  * License: GPL-2
=end

class Pokemon_Hash

  @@creature_types = Hash.new

  ##
  # Reads the nodes, and returns a hash of hashes
  #
  def Pokemon_Hash.read(filename)
    file = File.open( filename )
    ret = Hash.new
    
    yp = YAML::parse_documents( file ) do |tree|
      t = tree.transform
	if filename == "pokemon.txt"
		ret[t['NAME']] = t
	else ret[t['GYM']] = t
	end
    end

    file.close

    return ret
  end

  ##
  # Return a given creature (called by type)
  #
  def Pokemon_Hash.create(game, name, x, y, sex=:M, age=-1, speed=1)
    data = @@creature_types[name]

    atts = data

    age=rand(50) if age == -1
    atts["AGE"] = age
    if atts["PX"].respond_to? :intern
      atts["PX"] = atts["PX"].intern
    end
    atts["SEX"] = sex

    c = Creature.new(game, x, y, speed, data['AI'], atts)
    
    return c
  end

  ##
  # Returns a randomly created creature
  #
  def Pokemon_Hash.create_random(game, x, y, speed=1)
    i = rand(@@creature_types.length)
    name = @@creature_types.keys[i]
    return Pokemon_Array.create(game, name, x, y, speed)
  end

  ##
  # Returns an array with all the creature types
  #
  def Pokemon_Hash.names
    return @@creature_types.keys
  end

end
