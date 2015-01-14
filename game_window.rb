include Gosu

class GameWindow < Window
  def initialize
    super(640, 480, false)
    self.caption = "Ruby Snake"
    @background_image = Image.new(self, "Images/Grass.png", true)
    @snake = Snake.new(self)
    restart_all
    @font = Font.new(self, default_font_name, 50)
  end

  def update
    @snake.move if !@snake.broken
    if @snake.broken
      if @snake.lives > 1
        @snake.lives -= 1
        @snake.broken = false
        restart_all
        @snake.move
      elsif @snake.lives >= 0 # ако животите са 0 или 1
       @snake.lives = 0
       self.draw
      end
    end
  end

  def font_draw
    @font.draw("Lives: #{@snake.lives}", 10, 10, 1, 0.5, 0.5, 0xff00007A)
    @font.draw("Points: #{@snake.score}", 530, 10 , 1, 0.5, 0.5, 0xff00007A)
    @font.draw("Game Over", 210, 200, 100, 1, 1, 0xff00007A) if @snake.lives == 0 and @snake.broken
    @font.draw("Do you want to play again? Y/N", 162, 250, 100, 0.5, 0.5, 0xff00007A) if @snake.lives == 0 and @snake.broken
  end

  def draw
    font_draw
    @snake.draw
    @food.draw
    check_food_eaten
    @obstacles.each { |obstacle| obstacle.draw }
    check_obstacle_crash
    @background_image.draw(0, 0, 0);
  end

  def check_food_eaten
    if @snake.food_eaten(@food.x, @food.y)
      @food = Food.new(self)
    end
  end

  def restart_all
    @snake.warp(320, 240)
    @food = Food.new(self)
    @obstacles = []
    @obstacles[0] = Obstacle.new(self)
    @obstacles[1] = Obstacle.new(self)
    @obstacles[2] = Obstacle.new(self)
    @obstacles[3] = Obstacle.new(self)
    @obstacles[4] = Obstacle.new(self)
  end

  def check_obstacle_crash
    @obstacles.each do |obstacle|
      if @snake.obstacle_crash(obstacle.x, obstacle.y)
        obstacle = Obstacle.new(self)
      end
    end
  end

  def button_down(id)
    if id == KbEscape
      close
    end
    if @snake.broken and @snake.lives == 0
      if id == KbY
        @snake = Snake.new(self)
        restart_all
      end
      if id == KbN
        close
      end
    end
    @snake.button_down(id)
  end

end