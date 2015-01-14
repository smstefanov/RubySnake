include Gosu

class Obstacle

  attr_accessor :x, :y

  def initialize(window)
    @image = Image.new(window, "Images/Obstacle.bmp", false)
    @x = rand(20..620)
    @y = rand(50..460)
  end

  def draw
    @image.draw(@x, @y, 1)
  end

end
