#!/usr/bin/env ruby
require 'rubygems' rescue nil

$:<<'src'
require 'trainer'
require 'pokemon_hash'
require 'battle'
require 'curses'
require 'island'

POKEMON_HASH = Pokemon_Hash.read("files/etc/pokemon.txt")
TRAINER_HASH = Pokemon_Hash.read("files/trainers/trainers.txt")
TYPE_HASH = Pokemon_Hash.read("files/etc/types.txt")
DECISION_IMPORTANCE = Hash["Heal", 9, "Fight Trainer", 8, "Fight Gym", 7, "Aquiring Pokemon", 6, "EV Training", 5, "Arena Fighting", 4, "Breeding", 3, "Reorganizing Pokemon Team", 2, "Random Battle", 1, "Relaxing", 0 ]

  class Game
  	def initialize

    @kanto = Island.new("Kanto")
    
  	@scr = Curses.init_screen
  	@scr.keypad(true)
	  @scr.refresh

  	@runlevel = 1
	  @loopnumber = 1
	
  	handle_input(@scr)
  	end
  	
  end 

  def game_loop(runlevel, loopnumber)

	while @runlevel < 5 do

    if @runlevel == 1
      if (loopnumber % 5) == 0  
        @kanto.pulse
      end
    end

		puts
		puts "End of turn number " + loopnumber.to_s
		puts

		loopnumber += 1
		sleep 1
		
		if @runlevel == 5
			puts "Thread GAME LOOP ended"
		end

	end
	
  end

  def handle_input(scr)

	i = 0
	
	game_thread = Thread.new do
		game_loop(@runlevel, i)
	end

	while @runlevel < 5 do

		key = scr.getch
		
		puts i
		i += 1
			
		if key != -1
			case key
				when 'q'
					@runlevel = 5
					puts key.to_s + " is the key pressed"
					puts "Thread INPUT MONITOR ended"
				when '1'
					puts @loopnumber
					puts @runlevel
					puts key.to_s + " is the key pressed"
					@runlevel = 1
        when '2'
          puts @loopnumber
          puts @runlevel
          puts key.to_s + " is the key pressed"
          @runlevel = 2
        when '3'
          puts @loopnumber
          puts @runlevel
          puts key.to_s + " is the key pressed"
          @runlevel = 3
        when '4'
          puts @loopnumber
          puts @runlevel
          puts key.to_s + " is the key pressed"
          @runlevel = 4
				else
					puts key.to_s + " is the key pressed"
					puts "Not q or #1-4!"
			end
		end
			
		puts @runlevel.to_s + " equals runlevel"
	end

	game_thread.join #Ensures game thread loses no memory, and fully ends
		
  end


Game.new
