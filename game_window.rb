include Gosu

class GameWindow < Window
  def initialize

    super(640, 480, false)
    self.caption = "Ruby Snake"

    @background_image = Image.new(self, "Images/Grass.png", true)

    @snake = Snake.new(self)
    @snake.warp(320, 240)
  end

  def update
    @snake.move
  end

  def draw
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