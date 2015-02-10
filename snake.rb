include Gosu

class Snake

  attr_accessor :broken, :lives, :score

  def initialize(window)
    @image = Image.new(window, "Images/Snake.bmp", false)
    @x = @y = @vel_x = @vel_y = 0.0
    @angle = 0
    @score = 0
    @lives = 3
    @broken = false
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

  def food_eaten(x, y)
    if @x - 22 <= x and x <= @x + 8 and @y - 22 <= y and y <= @y + 8
      @score += 10
      true
    else
      false
    end
  end

  def obstacle_crash(x, y)
    if @x - 30 <= x and x <= @x + 10 and @y - 30 <= y and y <= @y + 10
      #@lives -= 1 if @lives > 0
      @broken = true
      true
    else
      false
    end
  end
  def move
    @vel_x = 0.02*@score
    @vel_y = 0.02*@score
    case @angle
    when 0 # right
      @x += 1
      @x += @vel_x
    when 90 # down!
      @y += 1
      @y += @vel_y
    when 180 # left
      @x -= 1
      @x -= @vel_x
    when 270 # up!
      @y -= 1
      @y -= @vel_y
    end
    if @x > 640 or @y > 480 or @x < 0 or @y < 0
      @broken = true
    end
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def button_down(id)
    return if broken
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
