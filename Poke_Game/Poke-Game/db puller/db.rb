

class Import
  def initialize
    
    puts "Import attempt"
    
    require 'sqlite3'
    database = SQLite3::Database.new( "veekun-pokedex.sqlite" )
    
    #database.execute( "create table sample_table (id INTEGER PRIMARY KEY, sample_text TEXT, sample_number NUMERIC);" )
    
    #database.execute( "insert into sample_table (sample_text,sample_number) values ('Sample Text1', 123)")
    #database.execute( "insert into sample_table (sample_text,sample_number) values ('Sample Text2', 456)")
    
    rows = Array.new
    
    
    
    649.times do |i|
      pokemon = database.execute( "SELECT id, name, capture_rate, base_experience, hatch_counter, gender_rate  FROM pokemon WHERE id = :iteration;", "iteration" => i+1 )
      
      stats = database.execute( "SELECT base_stat FROM pokemon_stats WHERE pokemon_id = :iteration;", "iteration" => i+1)
      
      types = database.execute( "SELECT type_id FROM pokemon_types WHERE pokemon_id = :iteration;", "iteration" => i+1)
      
      eggs = database.execute( "SELECT egg_group_id FROM pokemon_egg_groups WHERE pokemon_id = :iteration;", "iteration" => i+1)
      
      evolution_chain = database.execute( "SELECT evolution_chain_id  FROM pokemon WHERE id = :iteration;", "iteration" => i+1 )
      
      bob = evolution_chain.map
      bob2 = 0
      bob.each do |i|
        bob2 = i.pop
      end
      
      growth_rate = database.execute( "SELECT growth_rate_id FROM evolution_chains WHERE id = :iteration;", "iteration" => bob2 )
      
      evolution = database.execute( "SELECT from_pokemon_id, to_pokemon_id, evolution_trigger_id, minimum_level, trigger_item_id, gender, location_id, held_item_id  FROM pokemon_evolution WHERE from_pokemon_id = :iteration;", "iteration" => i+1 )
      
      pokemon << stats
      pokemon << growth_rate
      if evolution.length >= 1
        pokemon << evolution
      end
      pokemon << types
      pokemon << eggs
      rows << pokemon
      #rows << stats
      
      local_filename = "pokemon.txt"
      
      rows[i] = rows[i].to_s.delete "[],\""
      rows[i] = rows[i] + " "
      
      regex = "(.*?) "
      myarray = rows[i].scan(/(.*?) /)
      
      p myarray[0]
      
      if i == 0
        File.open(local_filename, 'w') {|f| f.write("#---Start of file\n") }
      end
      
      
      
      baselength = 17
      
      if evolution.length >= 2
        puts evolution.length
      end
      
      if evolution.length >= 1
        baselength += 8 * evolution.length
      end
      
      baselength.times do |i|
        case evolution.length
          when 0
          case i
            when 0 
            stat = "DEX: "
            when 1
            stat = "NAME: "
            when 2
            stat = "CAP: "
            when 3
            stat = "BASEXP: "
            when 4
            stat = "HATCH: "
            when 5
            stat = "GENDER: "
            when 6
            stat = "HP: "
            when 7
            stat = "ATK: "
            when 8
            stat = "DEF: "
            when 9
            stat = "SPATK: "
            when 10
            stat = "SPDEF: "
            when 11 
            stat = "SPEED: "
            when 12
            stat = "GROWTH: "
            when 13
            stat = "TYPE1: "  
            when 14
            if types.length == 2
              stat = "TYPE2: "
            else 
              stat = "EGG1: "
            end
            when 15
            if types.length == 2
              stat = "EGG1: "
            else
              if eggs.length == 2
                stat = "EGG2: "
              else  
                stat = "NOSTAT"
              end
            end
            when 16
            if types.length == 2
              if eggs.length == 2
                stat = "EGG2: "
              else  
                stat = "NOSTAT"
              end
            else  
              stat = "NOSTAT"
            end
          end
          
          when 1
          case i
            when 0 
            stat = "DEX: "
            when 1
            stat = "NAME: "
            when 2
            stat = "CAP: "
            when 3
            stat = "BASEXP: "
            when 4
            stat = "HATCH: "
            when 5
            stat = "GENDER: "
            when 6
            stat = "HP: "
            when 7
            stat = "ATK: "
            when 8
            stat = "DEF: "
            when 9
            stat = "SPATK: "
            when 10
            stat = "SPDEF: "
            when 11 
            stat = "SPEED: "
            when 12
            stat = "GROWTH: "
            when 13
            stat = "EVOL_FROM: "
            when 14
            stat = "EVOL_TO: "
            when 15
            stat = "EVOL_TRIG: "
            when 16
            stat = "EVOL_LEVEL: "
            when 17
            stat = "EVOL_ITEM: "
            when 18
            stat = "EVOL_GENDER: "  
            when 19
            stat = "EVOL_LOC: "
            when 20
            stat = "EVOL_HELD: "  
            when 21
            stat = "TYPE1: "  
            when 22
            if types.length == 2
              stat = "TYPE2: "
            else 
              stat = "EGG1: "
            end
            when 23
            if types.length == 2
              stat = "EGG1: "
            else
              if eggs.length == 2
                stat = "EGG2: "
              else  
                stat = "NOSTAT"
              end
            end
            when 24
            if types.length == 2
              if eggs.length == 2
                stat = "EGG2: "
              else  
                stat = "NOSTAT"
              end
            else  
              stat = "NOSTAT"
            end
          end
          
          when 2
          case i
            when 0 
            stat = "DEX: "
            when 1
            stat = "NAME: "
            when 2
            stat = "CAP: "
            when 3
            stat = "BASEXP: "
            when 4
            stat = "HATCH: "
            when 5
            stat = "GENDER: "
            when 6
            stat = "HP: "
            when 7
            stat = "ATK: "
            when 8
            stat = "DEF: "
            when 9
            stat = "SPATK: "
            when 10
            stat = "SPDEF: "
            when 11 
            stat = "SPEED: "
            when 12
            stat = "GROWTH: "
            when 13
            stat = "EVOL_FROM: "
            when 14
            stat = "EVOL_TO: "
            when 15
            stat = "EVOL_TRIG: "
            when 16
            stat = "EVOL_LEVEL: "
            when 17
            stat = "EVOL_ITEM: "
            when 18
            stat = "EVOL_GENDER: "  
            when 19
            stat = "EVOL_LOC: "
            when 20
            stat = "EVOL_HELD: "
            when 21
            stat = "EVOL_FROM_2: "
            when 22
            stat = "EVOL_TO_2: "
            when 23
            stat = "EVOL_TRIG_2: "
            when 24
            stat = "EVOL_LEVEL_2: "
            when 25
            stat = "EVOL_ITEM_2: "
            when 26
            stat = "EVOL_GENDER_2: "  
            when 27
            stat = "EVOL_LOC_2: "
            when 28
            stat = "EVOL_HELD_2: "  
            when 29
            stat = "TYPE1: "  
            when 30
            if types.length == 2
              stat = "TYPE2: "
            else 
              stat = "EGG1: "
            end
            when 31
            if types.length == 2
              stat = "EGG1: "
            else
              if eggs.length == 2
                stat = "EGG2: "
              else  
                stat = "NOSTAT"
              end
            end
            when 32
            if types.length == 2
              if eggs.length == 2
                stat = "EGG2: "
              else  
                stat = "NOSTAT"
              end
            else  
              stat = "NOSTAT"
            end
          end
          
          when 3
          case i
            when 0
            stat = "DEX: "
            when 1
            stat = "NAME: "
            when 2
            stat = "CAP: "
            when 3
            stat = "BASEXP: "
            when 4
            stat = "HATCH: "
            when 5
            stat = "GENDER: "
            when 6
            stat = "HP: "
            when 7
            stat = "ATK: "
            when 8
            stat = "DEF: "
            when 9
            stat = "SPATK: "
            when 10
            stat = "SPDEF: "
            when 11 
            stat = "SPEED: "
            when 12
            stat = "GROWTH: "
            when 13
            stat = "EVOL_FROM: "
            when 14
            stat = "EVOL_TO: "
            when 15
            stat = "EVOL_TRIG: "
            when 16
            stat = "EVOL_LEVEL: "
            when 17
            stat = "EVOL_ITEM: "
            when 18
            stat = "EVOL_GENDER: "  
            when 19
            stat = "EVOL_LOC: "
            when 20
            stat = "EVOL_HELD: "
            when 21
            stat = "EVOL_FROM_2: "
            when 22
            stat = "EVOL_TO_2: "
            when 23
            stat = "EVOL_TRIG_2: "
            when 24
            stat = "EVOL_LEVEL_2: "
            when 25
            stat = "EVOL_ITEM_2: "
            when 26
            stat = "EVOL_GENDER_2: "  
            when 27
            stat = "EVOL_LOC_2: "
            when 28
            stat = "EVOL_HELD_2: " 
            when 29
            stat = "EVOL_FROM_3: "
            when 30
            stat = "EVOL_TO_3: "
            when 31
            stat = "EVOL_TRIG_3: "
            when 32
            stat = "EVOL_LEVEL_3: "
            when 33
            stat = "EVOL_ITEM_3: "
            when 34
            stat = "EVOL_GENDER_3: "  
            when 35
            stat = "EVOL_LOC_3: "
            when 36
            stat = "EVOL_HELD_3: " 
            when 37
            stat = "TYPE1: "  
            when 38
            if types.length == 2
              stat = "TYPE2: "
            else 
              stat = "EGG1: "
            end
            when 39
            if types.length == 2
              stat = "EGG1: "
            else
              if eggs.length == 2
                stat = "EGG2: "
              else  
                stat = "NOSTAT"
              end
            end
            when 40
            if types.length == 2
              if eggs.length == 2
                stat = "EGG2: "
              else  
                stat = "NOSTAT"
              end
            else  
              stat = "NOSTAT"
            end
          end
          
          when 4
          case i
            when 0
            stat = "DEX: "
            when 1
            stat = "NAME: "
            when 2
            stat = "CAP: "
            when 3
            stat = "BASEXP: "
            when 4
            stat = "HATCH: "
            when 5
            stat = "GENDER: "
            when 6
            stat = "HP: "
            when 7
            stat = "ATK: "
            when 8
            stat = "DEF: "
            when 9
            stat = "SPATK: "
            when 10
            stat = "SPDEF: "
            when 11 
            stat = "SPEED: "
            when 12
            stat = "GROWTH: "
            when 13
            stat = "EVOL_FROM: "
            when 14
            stat = "EVOL_TO: "
            when 15
            stat = "EVOL_TRIG: "
            when 16
            stat = "EVOL_LEVEL: "
            when 17
            stat = "EVOL_ITEM: "
            when 18
            stat = "EVOL_GENDER: "  
            when 19
            stat = "EVOL_LOC: "
            when 20
            stat = "EVOL_HELD: "
            when 21
            stat = "EVOL_FROM_2: "
            when 22
            stat = "EVOL_TO_2: "
            when 23
            stat = "EVOL_TRIG_2: "
            when 24
            stat = "EVOL_LEVEL_2: "
            when 25
            stat = "EVOL_ITEM_2: "
            when 26
            stat = "EVOL_GENDER_2: "  
            when 27
            stat = "EVOL_LOC_2: "
            when 28
            stat = "EVOL_HELD_2: " 
            when 29
            stat = "EVOL_FROM_3: "
            when 30
            stat = "EVOL_TO_3: "
            when 31
            stat = "EVOL_TRIG_3: "
            when 32
            stat = "EVOL_LEVEL_3: "
            when 33
            stat = "EVOL_ITEM_3: "
            when 34
            stat = "EVOL_GENDER_3: "  
            when 35
            stat = "EVOL_LOC_3: "
            when 36
            stat = "EVOL_HELD_3: " 
            when 37
            stat = "EVOL_FROM_4: "
            when 38
            stat = "EVOL_TO_4: "
            when 39
            stat = "EVOL_TRIG_4: "
            when 40
            stat = "EVOL_LEVEL_4: "
            when 41
            stat = "EVOL_ITEM_4: "
            when 42
            stat = "EVOL_GENDER_4: "  
            when 43
            stat = "EVOL_LOC_4: "
            when 44
            stat = "EVOL_HELD_4: " 
            when 45
            stat = "TYPE1: "  
            when 46
            if types.length == 2
              stat = "TYPE2: "
            else 
              stat = "EGG1: "
            end
            when 47
            if types.length == 2
              stat = "EGG1: "
            else
              if eggs.length == 2
                stat = "EGG2: "
              else  
                stat = "NOSTAT"
              end
            end
            when 48
            if types.length == 2
              if eggs.length == 2
                stat = "EGG2: "
              else  
                stat = "NOSTAT"
              end
            else  
              stat = "NOSTAT"
            end
          end
          
          when 5
          case i
            when 0
            stat = "DEX: "
            when 1
            stat = "NAME: "
            when 2
            stat = "CAP: "
            when 3
            stat = "BASEXP: "
            when 4
            stat = "HATCH: "
            when 5
            stat = "GENDER: "
            when 6
            stat = "HP: "
            when 7
            stat = "ATK: "
            when 8
            stat = "DEF: "
            when 9
            stat = "SPATK: "
            when 10
            stat = "SPDEF: "
            when 11 
            stat = "SPEED: "
            when 12
            stat = "GROWTH: "
            when 13
            stat = "EVOL_FROM: "
            when 14
            stat = "EVOL_TO: "
            when 15
            stat = "EVOL_TRIG: "
            when 16
            stat = "EVOL_LEVEL: "
            when 17
            stat = "EVOL_ITEM: "
            when 18
            stat = "EVOL_GENDER: "  
            when 19
            stat = "EVOL_LOC: "
            when 20
            stat = "EVOL_HELD: "
            when 21
            stat = "EVOL_FROM_2: "
            when 22
            stat = "EVOL_TO_2: "
            when 23
            stat = "EVOL_TRIG_2: "
            when 24
            stat = "EVOL_LEVEL_2: "
            when 25
            stat = "EVOL_ITEM_2: "
            when 26
            stat = "EVOL_GENDER_2: "  
            when 27
            stat = "EVOL_LOC_2: "
            when 28
            stat = "EVOL_HELD_2: " 
            when 29
            stat = "EVOL_FROM_3: "
            when 30
            stat = "EVOL_TO_3: "
            when 31
            stat = "EVOL_TRIG_3: "
            when 32
            stat = "EVOL_LEVEL_3: "
            when 33
            stat = "EVOL_ITEM_3: "
            when 34
            stat = "EVOL_GENDER_3: "  
            when 35
            stat = "EVOL_LOC_3: "
            when 36
            stat = "EVOL_HELD_3: " 
            when 37
            stat = "EVOL_FROM_4: "
            when 38
            stat = "EVOL_TO_4: "
            when 39
            stat = "EVOL_TRIG_4: "
            when 40
            stat = "EVOL_LEVEL_4: "
            when 41
            stat = "EVOL_ITEM_4: "
            when 42
            stat = "EVOL_GENDER_4: "  
            when 43
            stat = "EVOL_LOC_4: "
            when 44
            stat = "EVOL_HELD_4: " 
            when 45
            stat = "EVOL_FROM_5: "
            when 46
            stat = "EVOL_TO_5: "
            when 47
            stat = "EVOL_TRIG_5: "
            when 48
            stat = "EVOL_LEVEL_5: "
            when 49
            stat = "EVOL_ITEM_5: "
            when 50
            stat = "EVOL_GENDER_5: "  
            when 51
            stat = "EVOL_LOC_5: "
            when 52
            stat = "EVOL_HELD_5: "
            when 53
            stat = "TYPE1: "  
            when 54
            if types.length == 2
              stat = "TYPE2: "
            else 
              stat = "EGG1: "
            end
            when 55
            if types.length == 2
              stat = "EGG1: "
            else
              if eggs.length == 2
                stat = "EGG2: "
              else  
                stat = "NOSTAT"
              end
            end
            when 56
            if types.length == 2
              if eggs.length == 2
                stat = "EGG2: "
              else  
                stat = "NOSTAT"
              end
            else  
              stat = "NOSTAT"
            end
          end
          
          when 6
          case i
            when 0
            stat = "DEX: "
            when 1
            stat = "NAME: "
            when 2
            stat = "CAP: "
            when 3
            stat = "BASEXP: "
            when 4
            stat = "HATCH: "
            when 5
            stat = "GENDER: "
            when 6
            stat = "HP: "
            when 7
            stat = "ATK: "
            when 8
            stat = "DEF: "
            when 9
            stat = "SPATK: "
            when 10
            stat = "SPDEF: "
            when 11 
            stat = "SPEED: "
            when 12
            stat = "GROWTH: "
            when 13
            stat = "EVOL_FROM: "
            when 14
            stat = "EVOL_TO: "
            when 15
            stat = "EVOL_TRIG: "
            when 16
            stat = "EVOL_LEVEL: "
            when 17
            stat = "EVOL_ITEM: "
            when 18
            stat = "EVOL_GENDER: "  
            when 19
            stat = "EVOL_LOC: "
            when 20
            stat = "EVOL_HELD: "
            when 21
            stat = "EVOL_FROM_2: "
            when 22
            stat = "EVOL_TO_2: "
            when 23
            stat = "EVOL_TRIG_2: "
            when 24
            stat = "EVOL_LEVEL_2: "
            when 25
            stat = "EVOL_ITEM_2: "
            when 26
            stat = "EVOL_GENDER_2: "  
            when 27
            stat = "EVOL_LOC_2: "
            when 28
            stat = "EVOL_HELD_2: " 
            when 29
            stat = "EVOL_FROM_3: "
            when 30
            stat = "EVOL_TO_3: "
            when 31
            stat = "EVOL_TRIG_3: "
            when 32
            stat = "EVOL_LEVEL_3: "
            when 33
            stat = "EVOL_ITEM_3: "
            when 34
            stat = "EVOL_GENDER_3: "  
            when 35
            stat = "EVOL_LOC_3: "
            when 36
            stat = "EVOL_HELD_3: " 
            when 37
            stat = "EVOL_FROM_4: "
            when 38
            stat = "EVOL_TO_4: "
            when 39
            stat = "EVOL_TRIG_4: "
            when 40
            stat = "EVOL_LEVEL_4: "
            when 41
            stat = "EVOL_ITEM_4: "
            when 42
            stat = "EVOL_GENDER_4: "  
            when 43
            stat = "EVOL_LOC_4: "
            when 44
            stat = "EVOL_HELD_4: " 
            when 45
            stat = "EVOL_FROM_5: "
            when 46
            stat = "EVOL_TO_5: "
            when 47
            stat = "EVOL_TRIG_5: "
            when 48
            stat = "EVOL_LEVEL_5: "
            when 49
            stat = "EVOL_ITEM_5: "
            when 50
            stat = "EVOL_GENDER_5: "  
            when 51
            stat = "EVOL_LOC_5: "
            when 52
            stat = "EVOL_HELD_5: " 
            when 53
            stat = "EVOL_FROM_6: "
            when 54
            stat = "EVOL_TO_6: "
            when 55
            stat = "EVOL_TRIG_6: "
            when 56
            stat = "EVOL_LEVEL_6: "
            when 57
            stat = "EVOL_ITEM_6: "
            when 58
            stat = "EVOL_GENDER_6: "  
            when 59
            stat = "EVOL_LOC_6: "
            when 60
            stat = "EVOL_HELD_6: " 
            when 61
            stat = "TYPE1: "  
            when 62
            if types.length == 2
              stat = "TYPE2: "
            else 
              stat = "EGG1: "
            end
            when 63
            if types.length == 2
              stat = "EGG1: "
            else
              if eggs.length == 2
                stat = "EGG2: "
              else  
                stat = "NOSTAT"
              end
            end
            when 64
            if types.length == 2
              if eggs.length == 2
                stat = "EGG2: "
              else  
                stat = "NOSTAT"
              end
            else  
              stat = "NOSTAT"
            end
          end
          
          when 7
          case i
            when 0 
            stat = "DEX: "
            when 1
            stat = "NAME: "
            when 2
            stat = "CAP: "
            when 3
            stat = "BASEXP: "
            when 4
            stat = "HATCH: "
            when 5
            stat = "GENDER: "
            when 6
            stat = "HP: "
            when 7
            stat = "ATK: "
            when 8
            stat = "DEF: "
            when 9
            stat = "SPATK: "
            when 10
            stat = "SPDEF: "
            when 11 
            stat = "SPEED: "
            when 12
            stat = "GROWTH: "
            when 13
            stat = "EVOL_FROM: "
            when 14
            stat = "EVOL_TO: "
            when 15
            stat = "EVOL_TRIG: "
            when 16
            stat = "EVOL_LEVEL: "
            when 17
            stat = "EVOL_ITEM: "
            when 18
            stat = "EVOL_GENDER: "  
            when 19
            stat = "EVOL_LOC: "
            when 20
            stat = "EVOL_HELD: "
            when 21
            stat = "EVOL_FROM_2: "
            when 22
            stat = "EVOL_TO_2: "
            when 23
            stat = "EVOL_TRIG_2: "
            when 24
            stat = "EVOL_LEVEL_2: "
            when 25
            stat = "EVOL_ITEM_2: "
            when 26
            stat = "EVOL_GENDER_2: "  
            when 27
            stat = "EVOL_LOC_2: "
            when 28
            stat = "EVOL_HELD_2: " 
            when 29
            stat = "EVOL_FROM_3: "
            when 30
            stat = "EVOL_TO_3: "
            when 31
            stat = "EVOL_TRIG_3: "
            when 32
            stat = "EVOL_LEVEL_3: "
            when 33
            stat = "EVOL_ITEM_3: "
            when 34
            stat = "EVOL_GENDER_3: "  
            when 35
            stat = "EVOL_LOC_3: "
            when 36
            stat = "EVOL_HELD_3: " 
            when 37
            stat = "EVOL_FROM_4: "
            when 38
            stat = "EVOL_TO_4: "
            when 39
            stat = "EVOL_TRIG_4: "
            when 40
            stat = "EVOL_LEVEL_4: "
            when 41
            stat = "EVOL_ITEM_4: "
            when 42
            stat = "EVOL_GENDER_4: "  
            when 43
            stat = "EVOL_LOC_4: "
            when 44
            stat = "EVOL_HELD_4: " 
            when 45
            stat = "EVOL_FROM_5: "
            when 46
            stat = "EVOL_TO_5: "
            when 47
            stat = "EVOL_TRIG_5: "
            when 48
            stat = "EVOL_LEVEL_5: "
            when 49
            stat = "EVOL_ITEM_5: "
            when 50
            stat = "EVOL_GENDER_5: "  
            when 51
            stat = "EVOL_LOC_5: "
            when 52
            stat = "EVOL_HELD_5: " 
            when 53
            stat = "EVOL_FROM_6: "
            when 54
            stat = "EVOL_TO_6: "
            when 55
            stat = "EVOL_TRIG_6: "
            when 56
            stat = "EVOL_LEVEL_6: "
            when 57
            stat = "EVOL_ITEM_6: "
            when 58
            stat = "EVOL_GENDER_6: "  
            when 59
            stat = "EVOL_LOC_6: "
            when 60
            stat = "EVOL_HELD_6: " 
            when 61
            stat = "EVOL_FROM_7: "
            when 62
            stat = "EVOL_TO_7: "
            when 63
            stat = "EVOL_TRIG_7: "
            when 64
            stat = "EVOL_LEVEL_7: "
            when 65
            stat = "EVOL_ITEM_7: "
            when 66
            stat = "EVOL_GENDER_7: "  
            when 67
            stat = "EVOL_LOC_7: "
            when 68
            stat = "EVOL_HELD_7: " 
            when 69
            stat = "TYPE1: "  
            when 70
            if types.length == 2
              stat = "TYPE2: "
            else 
              stat = "EGG1: "
            end
            when 71
            if types.length == 2
              stat = "EGG1: "
            else
              if eggs.length == 2
                stat = "EGG2: "
              else  
                stat = "NOSTAT"
              end
            end
            when 72
            if types.length == 2
              if eggs.length == 2
                stat = "EGG2: "
              else  
                stat = "NOSTAT"
              end
            else  
              stat = "NOSTAT"
            end
          end
          
        end
        
        clean_text = myarray[i].to_s.delete "[],\""
        if stat != "NOSTAT"
          File.open(local_filename, 'a') {|f| f.write(stat)}
          File.open(local_filename, 'a') {|f| f.write(clean_text + "\n") }
        end
        
      end
      
      if i !=649
        File.open(local_filename, 'a') {|f| f.write("---\n") }
      end
      
    end
    
  end
end

Import.new
