

class Import
  def initialize
    
    puts "Import attempt"
    
    require 'sqlite3'
    database = SQLite3::Database.new( "veekun-pokedex.sqlite" )
    
    rows = Array.new
    
    
    #type = database.execute( "SELECT damage_type_id FROM type_efficacy WHERE damage_type_id = :iteration;", "iteration" => i+1 )
    
    
    
    17.times do |i|
      
      pokemon = database.execute( "SELECT damage_factor FROM type_efficacy WHERE damage_type_id = :iteration;", "iteration" => i+1 )
      
      #type << pokemon
      rows << pokemon
      
      local_filename = "types.txt"
      
      type = "TYPE: " + (i + 1).to_s + "\n"
      
      rows[i] = rows[i].to_s.delete "[],\""
      rows[i] = rows[i] + " "
      
      regex = "(.*?) "
      myarray = rows[i].scan(/(.*?) /)
      
      if i == 0
        File.open(local_filename, 'w') {|f| f.write("#---Start of file\n") }
      end
      
      File.open(local_filename, 'a') {|f| f.write(type)}
      
      baselength = 17
      
      
      
      baselength.times do |i|
        stat = (i + 1).to_s + ": "
        
        
        clean_text = myarray[i].to_s.delete "[],\""
        if stat != "NOSTAT"
          File.open(local_filename, 'a') {|f| f.write(stat)}
          File.open(local_filename, 'a') {|f| f.write(clean_text + "\n") }
        end
        
      end
      
      if i !=17
        File.open(local_filename, 'a') {|f| f.write("---\n") }
      end
      
    end
    
  end
end

Import.new
