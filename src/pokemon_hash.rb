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
    
    YAML::parse_documents( file ) do |tree| 
      t = tree.transform
      
      case filename
        when "files/etc/pokemon.txt"
        ret[t['NAME']] = t
        when "files/trainers/trainers.txt"
        ret[t['GYM']] = t
        when "files/etc/types.txt"
        ret[t['TYPE']] = t
      else
        ret[t['NAME']] = t
      end
    end
    
    
    file.close
    
    return ret
  end
  
end
