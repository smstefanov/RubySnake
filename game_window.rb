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
    if button_down? KbLeft then
      @snake.turn_left
    end
    if button_down? KbRight then
      @snake.turn_right
    end
    if button_down? KbUp then
      @snake.turn_up
    end
    if button_down? KbDown then
      @snake.turn_down
    end
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
  end
end