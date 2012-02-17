#!/usr/bin/env ruby
require 'rubygems' rescue nil

$:<<'src'
require 'pokemon_hash'
require 'decision_tree'
require 'gosu'
require 'island'

POKEMON_HASH = Pokemon_Hash.read("files/etc/pokemon.txt")
TRAINER_HASH = Pokemon_Hash.read("files/trainers/trainers.txt")
TYPE_HASH = Pokemon_Hash.read("files/etc/types.txt")
DECISION_IMPORTANCE = Hash["Heal", 9, "Fight Trainer", 8, "Fight Gym", 7, "Aquiring Pokemon", 6, "EV Training", 5, "Arena Fighting", 4, "Breeding", 3, "Reorganizing Pokemon Team", 2, "Random Battle", 1, "Relaxing", 0 ]

  class GameWindow < Gosu::Window
    
    attr_accessor :trainer_array
    attr_accessor :message_array
    
    def initialize
      
      @message_array = Array.new
      
      (1..10).each do |i|
        @message_array << i
      end

      super(640, 480, false)
      self.caption = "Poke Game"
      
      @kanto = Island.new("Kanto")
      
      @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
      
      @background_image = Gosu::Image.new(self, "media/kanto_worldmap.png", true)
      
      @player = Player.new(self)
      
      @second = 1
      
    end
    
    def update
      
      @px = mouse_x
      @py = mouse_y  
      
      @past ||= Time.now.to_i
    
      if Time.now.to_i - @past >= @second
        @second += 1
        puts "1 second"
      end
      
      if Time.now.to_i - @past >= 5
        puts "5 seconds"
        @past = Time.now.to_i
        @second = 0
      
        @kanto.pulse
      end
      
    end
    
    def draw
      @background_image.draw(130, 100, ZOrder::Background)
      @player.draw(@px, @py, 0)
      
      (1..10).each do |j|
        @font.draw("#{j}: #{@message_array[-11+j]}", 10, (-10+(j*20)), ZOrder::UI, 1.0, 1.0, 0xffCC3300)
      end        
    end
    
    def button_down(id)
      if id == Gosu::KbEscape
        close
      end
    end
    
    def display_messages(message)
      @message_array << message
    end
    
  end


class Player

  def initialize(window)
    @image = Gosu::Image.new(window, "media/mouse-cursor-icon-small.png", false)
    @x = @y = @angle = 0.0
  end

  def draw(px, py, angle)
    @image.draw_rot(px+8, py+15, 1, angle)
  end
  
end

module ZOrder
  Background, UI, Player = *0..3
end

window = GameWindow.new
window.show
