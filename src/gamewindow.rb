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
    
    @route_clicked = nil

    @click
    
    # Color
    angle = 220
    float_s = 0.887
    float_v = 0.592
    @interface_color = Gosu::Color.from_hsv(angle, float_s, float_v)


    if float_s * 1.3 > 1.0
      @interface_color_dark = Gosu::Color.from_hsv(angle, 1.0, float_v*0.6)
    else
      @interface_color_dark = Gosu::Color.from_hsv(angle, float_s*1.3, float_v*0.6)
    end


    angle = angle + 180
    
    new_angle_1 = angle + 45
    if new_angle_1 > 360
      new_angle_1 -= 360
    end
    
    new_angle_2 = angle - 45
    if new_angle_2 > 360
      new_angle_2 -= 360
    end
    
    new_float_s = float_s * 1.2
    if new_float_s > 0.8
      new_float_s = 0.8
    end
    
    new_float_v = float_v * 1.55
    if new_float_v > 0.85
      new_float_v = 0.85
    end
    
    # Negative triad color at 90 degrees
    @text_color = Gosu::Color.from_hsv(new_angle_2, new_float_s, new_float_v)
    @text_color_2 = Gosu::Color.from_hsv(new_angle_1, new_float_s, new_float_v)

    # @interface_color_dark = calculate_color("dark", angle, float_s, float_v)
    # @text_color = calculate_color("text", angle, float_s, float_v)

    # Red and white, blink when hover
    @map_highlight_color_start_degree = 0
    @map_highlight_color_start_s = 0.863
    @map_highlight_color_start_v = 1.0

    @map_lowlight_color = Gosu::Color.new(0xffffffff)

    # Black lines
    @line_color = Gosu::Color.new(0xff000000)

    @line_width = 2

    # Current temp message list
    @message_array = Array.new
    @message_array << "Welcome to SimPokemon"
    
    super(width, height, false)
    self.caption = "Poke Game"
    
    @kanto = Island.new("Kanto")
    
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    
    @background_image = Gosu::Image.new(self, "media/kanto_worldmap.png", true)
    
    @player = Player.new(self)
    
    @best_trainer_level = 0
    
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
      
      @best_trainer_level = @kanto.trainers[0].pokemon[0].level
      @kanto.trainers.each do |trainer|
        if trainer.pokemon[0].level > @best_trainer_level
          @best_trainer_level = trainer.pokemon[0].level
        end
      end
      
      puts

      @kanto.trainers.each do |trainer|
        if trainer.pokemon[0].level == @best_trainer_level
          # trainer.stat
        end
      end
    end
    
  end
  
  def draw
   
    draw_ui

    # Map, Find someone to draw you something nice.
    @background_image.draw(@map_location_x, @map_location_y, ZOrder::Background)

    draw_routes

    # Player cursor
    # @player.draw(@px, @py, 0)
    
    # Temp message testing
    @messages_to_display = 4
    @message_array.last(@messages_to_display).each_with_index do |message, index|
      index += 1
      @font.draw("#{message}", 10, ((height-((@messages_to_display+1)*20))-10+(index*20)), ZOrder::UI, 1.0, 1.0, @text_color)
    end      
    
  end

  def draw_routes
    @map_highlight_color = Gosu::Color.from_hsv(@map_highlight_color_start_degree, @map_highlight_color_start_s, @map_highlight_color_start_v)
    
    @map_highlight_color_start_v -= 0.02
    if @map_highlight_color_start_v < 0.0
      @map_highlight_color_start_v = 1.0
    end

    @kanto.routes.each do |route|
      
      if route.is_mouse_hovering(@px-@map_location_x, @py-@map_location_y)
        #puts "Hovering over #{route.name}"
        
        increase_route_highlight_width = 4
        
        top = route.size_info["TOP"] + @map_location_y - increase_route_highlight_width
        bottom = route.size_info["BOTTOM"] + @map_location_y + increase_route_highlight_width
        left = route.size_info["LEFT"] + @map_location_x - increase_route_highlight_width
        right = route.size_info["RIGHT"] + @map_location_x + increase_route_highlight_width
        
        line_width = 2
        
        draw_outline_rectangle(top, bottom, left, right, line_width, @map_highlight_color)
        
        #Name of route
        text_width = @font.text_width(route.display_name)
        route_x = @map_location_x+(@map_width/2)-(text_width/2)
        draw_filled_rectangle(@map_location_y+4, @map_location_y+32, route_x-4, route_x+text_width+10, @interface_color)
        draw_filled_rectangle(@map_location_y+8, @map_location_y+28, route_x, route_x+text_width+6, @interface_color_dark)
        @font.draw(route.display_name, route_x+3, @map_location_y+8, ZOrder::UI, 1.0, 1.0, @text_color)
      end  
    end
  end
  
  def draw_outline_rectangle(top, bottom, left, right, line_width, color)
    draw_quad(left+line_width, top+line_width, @map_highlight_color,
              right-line_width, top+line_width, @map_highlight_color,
              right-line_width, top-line_width, @map_highlight_color,
              left+line_width, top-line_width, @map_highlight_color)
    draw_quad(left+line_width, bottom+line_width, @map_highlight_color,
              right-line_width, bottom+line_width, @map_highlight_color,
              right-line_width, bottom-line_width, @map_highlight_color,
              left+line_width, bottom-line_width, @map_highlight_color)
    draw_quad(left+line_width, top+line_width, @map_highlight_color,
              left-line_width, top+line_width, @map_highlight_color,
              left-line_width, bottom-line_width, @map_highlight_color,
              left+line_width, bottom-line_width, @map_highlight_color)
    draw_quad(right+line_width, top+line_width, @map_highlight_color,
              right-line_width, top+line_width, @map_highlight_color,
              right-line_width, bottom-line_width, @map_highlight_color,
              right+line_width, bottom-line_width, @map_highlight_color) 
  end

  def draw_filled_rectangle(top, bottom, left, right, color)
    draw_quad(left, top, color,
              right, top, color,
              right, bottom, color,
              left, bottom, color) 
  end

  def draw_ui

    # Temp Interface drawing
    draw_filled_rectangle(0, @height, 0, @width, @interface_color)

    # Left rectangle darkened
    draw_filled_rectangle(@map_location_y+8, @map_location_y+@map_height-8, 0+8, @map_location_x-8, @interface_color_dark)

    # Bottom rectangle darkened
    draw_filled_rectangle(@map_location_y+@map_height+8, @height-8, 0+8, @width-8, @interface_color_dark)

    # Top rectangle darkened
    draw_filled_rectangle(0+8, @map_location_y-8, 0+8, @width-8, @interface_color_dark)

    # Right rectangle darkened
    draw_filled_rectangle(@map_location_y+8, @map_location_y+@map_height-8, @map_location_x+@map_width+8, @width-8, @interface_color_dark)

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
    @font.draw("Name: #{@kanto.name}", 10, (@map_location_y-10+(20)), ZOrder::UI, 1.0, 1.0, @text_color)
    @font.draw("Avg: #{@kanto.average_level}", 10, (@map_location_y-10+(40)), ZOrder::UI, 1.0, 1.0, @text_color)
    @font.draw("Trnrs: #{@kanto.trainers.size}", 10, (@map_location_y-10+(60)), ZOrder::UI, 1.0, 1.0, @text_color)
    @font.draw("Top IV: #{@kanto.top_iv}", 10, (@map_location_y-10+(80)), ZOrder::UI, 1.0, 1.0, @text_color)
    @font.draw("Trainer: #{@kanto.top_iv_trainer.name}", 10, (@map_location_y-10+(100)), ZOrder::UI, 1.0, 1.0, @text_color)
    @font.draw("Top lvl: #{@best_trainer_level}", 10, (@map_location_y-10+(120)), ZOrder::UI, 1.0, 1.0, @text_color)
    @font.draw("test text", 10, (@map_location_y-10+(140)), ZOrder::UI, 1.0, 1.0, @text_color)
    @font.draw("test text", 10, (@map_location_y-10+(160)), ZOrder::UI, 1.0, 1.0, @text_color)

    # Center right quad
    if @route_clicked != nil
      @font.draw("#{@route_clicked.display_name}", 10+@map_location_x+@map_width, (@map_location_y-10+(20)), ZOrder::UI, 1.0, 1.0, @text_color)
      @font.draw("#{@route_clicked.name}", 10+@map_location_x+@map_width, (@map_location_y-10+(40)), ZOrder::UI, 1.0, 1.0, @text_color)
      @font.draw("#{@route_clicked.name}", 10+@map_location_x+@map_width, (@map_location_y-10+(60)), ZOrder::UI, 1.0, 1.0, @text_color)
    end
    
  end

  def button_down(id)
    case id
      
    when Gosu::MsLeft
      @kanto.routes.each do |route|
        if route.is_mouse_hovering(@px-@map_location_x, @py-@map_location_y)
          puts route.name
          @route_clicked = route
        end
      end

    when  Gosu::KbEscape
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
