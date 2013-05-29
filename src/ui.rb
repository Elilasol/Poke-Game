class UI

  def initialize(window, width, height)
    
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
    
  end

  def draw

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
  end

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

module ZOrder
  Background, UI, Player = *0..3
end
