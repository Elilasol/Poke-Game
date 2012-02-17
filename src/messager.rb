module Startup
  WINDOW = GameWindow.new
  
  class Messager(message)
    ::WINDOW.message_array << message
  end
  
  class GameWindow < Gosu::Window
    
    attr_accessor :trainer_array
    attr_accessor :message_array
    
    def initialize
      
      @message_array = Array.new
      
      10.times do |i|
        @message_array << i
      end

      super(640, 480, false)
      self.caption = "Poke Game"
      
      @kanto = Island.new("Kanto")
      
      @font = Gosu::Font.new(::WINDOW, Gosu::default_font_name, 20)
      
      @background_image = Gosu::Image.new(::WINDOW, "media/kanto_worldmap.png", true)
      
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
      
      (1..10) do |j|
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
  
  
  
end
