include Gosu

class GameWindow < Window

  attr_accessor :food, :obstacles

  def self.window
    @@window
  end

  def initialize
    super(640, 480, false)
    @@window = self
    self.caption = "Ruby Snake"
    @background_image = Image.new(self, "Images/Grass.png", true)
    @snake = Snake.new()
    restart_all
    @font = Font.new(self, default_font_name, 50)
    @paused = false
  end

  def update
    if !@paused and !@snake.broken
      @snake.move
    end
  end

  def font_draw
    @font.draw("Lives: #{@snake.lives}", 10, 10, 1, 0.5, 0.5, 0xff00007A)
    @font.draw("Points: #{@snake.all_score}", 520, 10 , 1, 0.5, 0.5, 0xff00007A)
    @font.draw("Game Over", 210, 200, 100, 1, 1, 0xff00007A) if @snake.lives == 0 and @snake.broken
    @font.draw("Do you want to play again? Y/N", 162, 250, 100, 0.5, 0.5, 0xff00007A) if @snake.lives == 0 and @snake.broken
    @font.draw("Pause", 250, 220, 100, 1, 1, 0xff00007A) if @paused
  end

  def draw
    font_draw
    @snake.draw
    @food.draw
    @obstacles.each { |obstacle| obstacle.draw }
    @background_image.draw(0, 0, 0);
  end

  def restart_all
    @snake.score = 0
    @snake.tail = nil
    @snake.warp(320, 240)
    @food = Food.new()
    @obstacles = []
    @obstacles[0] = Obstacle.new()
    @obstacles[1] = Obstacle.new()
    @obstacles[2] = Obstacle.new()
    @obstacles[3] = Obstacle.new()
    @obstacles[4] = Obstacle.new()
  end

  def button_down(id)
    if id == KbEscape
      close
    end
    if id == KbSpace
      @paused = !@paused
    end
    if @snake.broken and @snake.lives == 0
      if id == KbY
        @snake = Snake.new()
        restart_all
      end
      if id == KbN
        close
      end
    end
    if !@paused
      @snake.button_down(id)
    end
  end

end