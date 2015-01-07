require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super 1024, 768, false
    self.caption = "Ruby Snake Game"
  end

  def update
  end

  def draw
  end
end

window = GameWindow.new
window.show