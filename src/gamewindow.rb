require 'gosu'
require 'island'
require 'player'

class GameWindow < Gosu::Window
  
  attr_accessor :trainer_array
  attr_accessor :message_array
  
  def initialize(height=480, width=640)

    @height = height
    @width = width
    
    @map_height = 287
    @map_width = 383
    
    @map_location_x = (width - @map_width) / 2
    @map_location_y = (height - @map_height) / 2
    
    # Color
    @interface_color = Gosu::Color.new(0xffcccc66)
    @line_color = Gosu::Color.new(0xff000000)
    @line_width = 2

    # Current temp message list
    @message_array = Array.new
    (1..20).each do |i|
      @message_array << i
    end
    
    super(width, height, false)
    self.caption = "Poke Game"
    
    @kanto = Island.new("Kanto")
    
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    
    @background_image = Gosu::Image.new(self, "media/kanto_worldmap.png", true)
    
    @player = Player.new(self)
    
    def needs_cursor?
      true
    end

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
      
      best_trainer_level = @kanto.trainers[0].pokemon[0].level
      @kanto.trainers.each do |trainer|
        if trainer.pokemon[0].level > best_trainer_level
          best_trainer_level = trainer.pokemon[0].level
        end
      end
      
      puts

      @kanto.trainers.each do |trainer|
        if trainer.pokemon[0].level == best_trainer_level
          trainer.stat
        end
      end
    end
    
  end
  
  def draw
   
    draw_ui

    # Map, Find someone to draw you something nice.
    @background_image.draw(@map_location_x, @map_location_y, ZOrder::Background)

    # Player cursor
    # @player.draw(@px, @py, 0)
    
    # Temp message testing
    @messages_to_display = 4
    @message_array.last(@messages_to_display).each_with_index do |message, index|
      index += 1
      @font.draw("#{index}: #{message}", 10, ((height-((@messages_to_display+1)*20))-10+(index*20)), ZOrder::UI, 1.0, 1.0, 0xffCC3300)
    end      
    
  end

  def draw_ui

    # Temp Interface drawing
    draw_quad(0, 0, @interface_color,
              width, 0, @interface_color,
              width, height, @interface_color,
              0, height, @interface_color)
    
    # Full rectangle
    draw_quad(@map_location_x-@line_width, @map_location_y-@line_width, @line_color,
              @map_location_x+@map_width+@line_width, @map_location_y-@line_width, @line_color,
              @map_location_x+@map_width+@line_width, @map_location_y+@map_height+@line_width, @line_color,
              @map_location_x-@line_width, @map_location_y+@map_height+@line_width, @line_color)
    
    # Line across top
    draw_quad(0, @map_location_y+@map_height, @line_color,
              width, @map_location_y+@map_height, @line_color,
              width, @map_location_y+@map_height+@line_width, @line_color,
              0, @map_location_y+@map_height+@line_width, @line_color)

    # Line across bottom
    draw_quad(0, @map_location_y, @line_color,
              width, @map_location_y, @line_color,
              width, @map_location_y-@line_width, @line_color,
              0, @map_location_y-@line_width, @line_color) 
    
    # Center left quad
    # Island data formatting
    @font.draw("Name: #{@kanto.name}", 10, (@map_location_y-10+(20)), ZOrder::UI, 1.0, 1.0, 0xffCC3300)
    @font.draw("Avg: #{@kanto.average_level}", 10, (@map_location_y-10+(40)), ZOrder::UI, 1.0, 1.0, 0xffCC3300)
    @font.draw("Trnrs: #{@kanto.trainers.size}", 10, (@map_location_y-10+(60)), ZOrder::UI, 1.0, 1.0, 0xffCC3300)
    @font.draw("Top IV: #{@kanto.top_iv}", 10, (@map_location_y-10+(80)), ZOrder::UI, 1.0, 1.0, 0xffCC3300)
    @font.draw("Trainer: #{@kanto.top_iv_trainer.name}", 10, (@map_location_y-10+(100)), ZOrder::UI, 1.0, 1.0, 0xffCC3300)
    @font.draw("test text", 10, (@map_location_y-10+(120)), ZOrder::UI, 1.0, 1.0, 0xffCC3300)
    @font.draw("test text", 10, (@map_location_y-10+(140)), ZOrder::UI, 1.0, 1.0, 0xffCC3300)
    @font.draw("test text", 10, (@map_location_y-10+(160)), ZOrder::UI, 1.0, 1.0, 0xffCC3300)
    
    
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
  
  #def display_messages(message)
  #  @message_array << message
  #end
  
end

module ZOrder
  Background, UI, Player = *0..3
end
