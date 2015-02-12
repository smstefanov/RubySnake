include Gosu

require_relative 'aabb.rb'

class Obstacle

  attr_accessor :x, :y

  def initialize()
    @image = Image.new(GameWindow.window, "Images/Obstacle.bmp", false)
    @x = rand(20..620)
    @y = rand(50..460)
  end

  def draw
    @image.draw(@x, @y, 1)
  end

end
