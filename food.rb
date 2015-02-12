include Gosu

require_relative 'aabb.rb'

class Food

  attr_accessor :x, :y

  def initialize()
    @image = Image.new(GameWindow.window, "Images/Food.png", false)
    replace
    until Obstacle.obstacle_free? aabb do
      replace
    end
  end

  def replace
    grid_size = GameWindow.grid_size
    window_size = GameWindow.window_size
    @x = (rand(window_size[0]/grid_size[0] - 2).round + 1)*grid_size[0]
    @y = (rand(window_size[1]/grid_size[1] - 2).round + 1)*grid_size[1]
  end

  def draw
    @image.draw_rot(@x, @y, 1, 0)
  end

  def aabb
    AABB.new(@x - @image.width/2, @y - @image.height/2, @x + @image.width/2, @y + @image.height/2)
  end

end