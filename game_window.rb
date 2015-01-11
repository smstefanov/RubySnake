include Gosu

class GameWindow < Window
  def initialize
    super(640, 480, false)
    self.caption = "Ruby Snake"
    @background_image = Image.new(self, "Images/Grass.png", true)
    @snake = Snake.new(self)
    @snake.warp(320, 240)
    @font = Font.new(self, default_font_name, 50)
  end

  def update
    @snake.move if !@snake.broken
  end

  def draw
    @font.draw("Game Over", 210, 200, 1, 1, 1, 0xff00007A) if @snake.broken
    @snake.draw
    @background_image.draw(0, 0, 0);
  end

  def button_down(id)
    if id == KbEscape
      close
    end
    @snake.button_down(id)
  end
end