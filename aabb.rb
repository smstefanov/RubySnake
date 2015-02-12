class AABB
  attr_accessor :x1, :y1, :x2, :y2

  def initialize(x1, y1, x2, y2)
    @x1, @y1, @x2, @y2 = x1, y1, x2, y2
  end

  def intersects?(other)
    not (other.x2 - 1 < x1 or other.y2 - 1 < y1 or other.x1 + 1 > x2 or other.y1 + 1 > y2)
  end
end