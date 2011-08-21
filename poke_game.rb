#!/usr/bin/env ruby
require 'rubygems' rescue nil

$:<<'src'
require 'hero'
require 'pokemon_hash'
require 'battle'
require 'curses'
require 'decision_tree'

ROUTE_1_HASH = Pokemon_Hash.read("route_1.txt")
POKEMON_HASH = Pokemon_Hash.read("pokemon.txt")
TRAINER_HASH = Pokemon_Hash.read("trainers.txt") 
ROUTE_1_HASH = Pokemon_Hash.read("route_1.txt") 
DECISION_IMPORTANCE = Hash["Heal", 9, "Fight Trainer", 8, "Fight Gym", 7, "Aquiring Pokemon", 6, "EV Training", 5, "Arena Fighting", 4, "Breeding", 3, "Reorganizing Pokemon Team", 2, "Random Battle", 1, "Relaxing", 0 ]

  class Game
  	def initialize

	@scr = Curses.init_screen
	@scr.keypad(true)
	@scr.refresh

	@runlevel = 1
	@loopnumber = 1

	#thready = Thread.new do
	#	loop do
	#		Kernel.exit if @scr.getch == /q/
	#	end
	#end		

  	#game_loop(runlevel, loopnumber)
	
	handle_input(@scr)

  	end
  	
  end 

  def game_loop(runlevel, loopnumber)
  
	hero_file = false

	while @runlevel < 5 do
		
		

		if !hero_file
			hero_array = make_hero_array
			hero_file = true
		end

		if @runlevel == 1

		
		end

		if @runlevel == 2
			hero_array.each do |i|
				Decision_Tree.new(i, hero_array)
			
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
				when 's'
					puts @loopnumber
					puts @runlevel
					puts key.to_s + " is the key pressed"
					@runlevel = 2
				else
					@runlevel = 4
					puts key.to_s + " is the key pressed"
					puts "Not q or s!"
			end
		end
			
		puts @runlevel.to_s + " equals runlevel"
	end

	game_thread.join #Ensures game thread loses no memory, and 				 #fully ends
		
  end

  def make_hero_array
	n = 3
	puts "Adding " + n.to_s + " Heros."
	puts "\n"
	hero_array = Array.new
		n.times do |i|
			hero_array << @hero = Hero.new
		end

	bob = Battle.new(hero_array[2], hero_array[1])

	hero_array
  end


Game.new
