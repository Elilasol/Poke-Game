class Player

  def initialize(window)
    @image = Gosu::Image.new(window, "media/mouse-cursor-icon-small.png", false)
    @x = @y = @angle = 0.0
  end

  def draw(px, py, angle)
    @image.draw_rot(px+8, py+15, 1, angle)
  end
  
end
