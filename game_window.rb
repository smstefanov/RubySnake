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
    if @snake.broken
      if @snake.lives > 1
        @snake.lives -= 1
        @snake.broken = false
        @snake.warp(320,240)
        @snake.move
      elsif @snake.lives >= 0 # ако животите са 0 или 1
       @snake.lives = 0
       self.draw
      end
    end
  end

  def draw
    @font.draw("Lives: #{@snake.lives}", 10, 10, 0.5, 0.5, 0.5, 0xff00007A)
    @font.draw("Points: #{@snake.score}", 540, 10 , 0.5, 0.5, 0.5, 0xff00007A)
    @font.draw("Game Over", 210, 200, 1, 1, 1, 0xff00007A) if @snake.lives == 0 and @snake.broken
    @font.draw("Do you want to play again? Y/N", 162, 250, 0.5, 0.5, 0.5, 0xff00007A) if @snake.lives == 0 and @snake.broken
    @snake.draw
    @background_image.draw(0, 0, 0);
  end

  def button_down(id)
    if id == KbEscape
      close
    end
    if @snake.broken
      if id == KbY
        @snake = Snake.new(self)
        @snake.warp(320, 240)
      end
      if id == KbN
        close
      end
    end
    @snake.button_down(id)
  end

end