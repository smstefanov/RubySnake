include Gosu

class Snake
  def initialize(window)
    @image = Image.new(window, "Images/Snake.bmp", false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= 90
  end

  def turn_right
    @angle += 90
  end

  def turn_up
    @angle += 90
  end

  def turn_down
    @angle += 90
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
end