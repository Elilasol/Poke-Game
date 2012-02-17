require 'gosu'
require 'island'
require 'player'

class GameWindow < Gosu::Window
  
  attr_accessor :trainer_array
  attr_accessor :message_array
  
  def initialize
    
    @message_array = Array.new
    
    (1..20).each do |i|
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
    
    @message_array.last(10).each_with_index do |message, index|
      index += 1
      @font.draw("#{index}: #{message}", 10, (-10+(index*20)), ZOrder::UI, 1.0, 1.0, 0xffCC3300)
    end      
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
