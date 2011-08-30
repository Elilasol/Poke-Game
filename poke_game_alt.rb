#!/usr/bin/env ruby
require 'rubygems' rescue nil

$:<<'src'
require 'pokemon_hash'
require 'decision_tree'
require 'gosu'
require 'island'

POKEMON_HASH = Pokemon_Hash.read("files/etc/pokemon.txt")
TRAINER_HASH = Pokemon_Hash.read("files/trainers/trainers.txt")
DECISION_IMPORTANCE = Hash["Heal", 9, "Fight Trainer", 8, "Fight Gym", 7, "Aquiring Pokemon", 6, "EV Training", 5, "Arena Fighting", 4, "Breeding", 3, "Reorganizing Pokemon Team", 2, "Random Battle", 1, "Relaxing", 0 ]


class GameWindow < Gosu::Window

  attr_reader :message_1
  attr_reader :message_2
  attr_reader :message_3
  attr_reader :message_4
  attr_reader :message_5
  attr_reader :message_6
  attr_reader :message_7
  attr_reader :message_8
  attr_reader :message_9
  attr_reader :message_10
  attr_reader :trainer_array
  attr_reader :message_array

  def initialize
	super(640, 480, false)
	self.caption = "Poke Game"
  
  kanto = Island.new("Kanto")
  
	@font = Gosu::Font.new(self, Gosu::default_font_name, 20)

	@background_image = Gosu::Image.new(self, "media/kanto_worldmap.png", true)

	@player = Player.new(self)
	@player.warp(320, 240)

  @trainer_array = kanto.trainers
  
	@second = 1


	@message_1 ||= "1"
	@message_2 ||= "2"
	@message_3 ||= "3"
	@message_4 ||= "4"
	@message_5 ||= "5"
	@message_6 ||= "6"
	@message_7 ||= "7"
	@message_8 ||= "8"
	@message_9 ||= "9"
	@message_10 ||= "10"

  end

  def update

	if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @player.move_left
    end
    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @player.move_right
    end
    if button_down? Gosu::KbUp or button_down? Gosu::GpUp then
      @player.move_up
    end
    if button_down? Gosu::KbDown or button_down? Gosu::GpDown then
      @player.move_down

	end
	
	
	@past ||= Time.now.to_i
	
	
	if Time.now.to_i - @past >= @second
		@second += 1
		puts "1 second"
  	end
	
	if Time.now.to_i - @past >= 5
		puts "5 seconds"
		@past = Time.now.to_i
		@second = 0
		
		@trainer_array.each do |i|
			Decision_Tree.new(i, @trainer_array)
			output = i.current_action_get.to_s
			display_messages(output)
			display_messages(i.pokemon[0].level)
      
		end
  	end

  end

  def draw
    @background_image.draw(130, 100, ZOrder::Background)
    @player.draw

    @font.draw("1: #{@message_1}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffCC3300)
    @font.draw("2: #{@message_2}", 10, 30, ZOrder::UI, 1.0, 1.0, 0xffCC3300)
    @font.draw("3: #{@message_3}", 10, 50, ZOrder::UI, 1.0, 1.0, 0xffCC3300)
    @font.draw("4: #{@message_4}", 10, 70, ZOrder::UI, 1.0, 1.0, 0xffCC3300)
    @font.draw("5: #{@message_5}", 10, 90, ZOrder::UI, 1.0, 1.0, 0xffCC3300)
    @font.draw("6: #{@message_6}", 10, 110, ZOrder::UI, 1.0, 1.0, 0xffCC3300)
    @font.draw("7: #{@message_7}", 10, 130, ZOrder::UI, 1.0, 1.0, 0xffCC3300)
    @font.draw("8: #{@message_8}", 10, 150, ZOrder::UI, 1.0, 1.0, 0xffCC3300)
    @font.draw("9: #{@message_9}", 10, 170, ZOrder::UI, 1.0, 1.0, 0xffCC3300)
    @font.draw("10: #{@message_10}", 10, 190, ZOrder::UI, 1.0, 1.0, 0xffCC3300)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

  def display_messages(message)
	@message_1 = @message_2
	@message_2 = @message_3
	@message_3 = @message_4
	@message_4 = @message_5
	@message_5 = @message_6
	@message_6 = @message_7
	@message_7 = @message_8
	@message_8 = @message_9
	@message_9 = @message_10
	@message_10 = message
  end

end

class Player

  def initialize(window)
    @image = Gosu::Image.new(window, "media/Starfighter.bmp", false)
    @x = @y = @angle = 0.0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def move_left
    @x -= 3
  end

  def move_right
    @x += 3
  end

  def move_up
    @y -= 3
  end

  def move_down
    @y += 3
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

end

module ZOrder
  Background, Player, UI = *0..3
end

window = GameWindow.new
window.show