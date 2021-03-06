include Gosu

require_relative 'aabb.rb'

class Snake

  attr_accessor :broken, :lives, :score, :all_score, :tail, :image

  def initialize()
    @image = Image.new(GameWindow.window, "Images/Snake.bmp", false)
    @tail = nil
    @x = @y = 0.0
    @angle = 0
    @score = 0
    @all_score = 0
    @lives = 3
    @broken = false
    @move_count = 1
  end

  def snake_position(x, y)
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
    @move_count += 1

    return if @move_count % [1, (25 - @score/5).ceil].max != 0

    @tail.move(@x, @y) if @tail

    case @angle
    when 0 # right
      @x += @image.width
    when 90 # down!
      @y += @image.height
    when 180 # left
      @x -= @image.width
    when 270 # up!
      @y -= @image.height
    end

    check_death_condition
    check_food_eaten
  end

  def check_death_condition
    check_obstacle_crash
    check_tail_crash

    if @x > 640 or @y > 480 or @x < 0 or @y < 0
      @broken = true
    end

    if @broken
      if @lives > 1
        @lives -= 1
        @broken = false
        GameWindow.window.restart_all
        move
      elsif @lives >= 0 # ако животите са 0 или 1
        @lives = 0
      end
    end
  end

  def aabb
    AABB.new(@x - @image.width/2, @y - @image.height/2, @x + @image.width/2, @y + @image.height/2)
  end

  def food_eaten(aabb)
    if self.aabb.intersects aabb then
      @score += 10
      @all_score += 10
      add_tail
      true
    else
      false
    end
  end

  def check_food_eaten
    if food_eaten(GameWindow.window.food.aabb)
      GameWindow.window.food = Food.new()
    end
  end

  def obstacle_crash(aabb)
    if self.aabb.intersects aabb then
      #@lives -= 1 if @lives > 0
      @broken = true
      true
    else
      false
    end
  end

  def check_obstacle_crash
    GameWindow.window.obstacles.each do |obstacle|
      if obstacle_crash(obstacle.aabb)
        obstacle = Obstacle.new()
      end
    end
  end

  def add_tail
    if @tail
      @tail.add_tail
    else
      @tail = Tail.new(@x, @y)
    end
  end

 def check_tail_crash
    if @tail and @tail.tail_crash(aabb)
      @broken = true
      true
    else
      false
    end
  end

  def draw
    @image.draw_rot(@x, @y, 3, @angle)
    @tail.draw if @tail
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