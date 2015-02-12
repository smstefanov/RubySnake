include Gosu

require_relative 'aabb.rb'

class Tail

  def initialize(x, y)
    @image = Image.new(GameWindow.window, "Images/Tail.bmp", false)
    @x, @y = x, y
    @next = nil
  end

  def draw
    @image.draw_rot(@x, @y, 2, 0)
    @next.draw if @next
  end

  def add_tail
    if @next
      @next.add_tail
    else
      @next = Tail.new(@x, @y)
    end
  end

  def tail_crash(snake_aabb)
    if aabb.intersects snake_aabb
      true
    elsif @next
      @next.tail_crash(snake_aabb)
    else
      false
    end
  end

  def aabb
    AABB.new(@x - @image.width/2, @y - @image.height/2, @x + @image.width/2, @y + @image.height/2)
  end

  def move(x, y)
    @next.move(@x, @y) if @next
    @x = x
    @y = y
  end

end