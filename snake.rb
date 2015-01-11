include Gosu

class Snake
  def initialize(window)
    @image = Image.new(window, "Images/Snake.bmp", false)
    @x = @y = @vel_x = @vel_y = 0.0
    @angle = 0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @angle = 180 if @angle != 0

  end

  def turn_right
    @angle = 0 if @angle != 180
  end

  def turn_up
    @angle = 270 if @angle != 90
  end

  def turn_down
    @angle = 90 if @angle != 270
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 640
    @y %= 480
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def button_down(id)
    if id == KbLeft then
      turn_left
    end
    if id == KbRight then
      turn_right
    end
    if id == KbUp then
      turn_up
    end
    if id == KbDown then
      turn_down
    end
  end
end