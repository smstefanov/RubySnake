include Gosu

require_relative 'aabb.rb'

class Food

  attr_accessor :x, :y

  def initialize()
    @image = Image.new(GameWindow.window, "Images/Food.png", false)
    @x = rand(20..620)
    @y = rand(50..460)
    "while !unique
      @x = rand(20..620)
      @y = rand(50..460)
    end
    GameWindow.objects[:food] = [@x, @y]"
  end

  "def unique
    if
  end"

  def draw
    @image.draw(@x, @y, 1)
  end

end
