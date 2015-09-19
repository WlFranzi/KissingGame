class Kisserin
  def initialize
    @image = Gosu::Image.new('media/kisserin.png')
    @x = @y = @vel_y = @vel_x = @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= 4.5
  end

  def turn_right
    @angle += 4.5
  end

  def accelerate
    @vel_x += Gosu::offset_x(@angle, 0.5)
    @vel_y += Gosu::offset_y(@angle, 0.5)
  end

  # def deccelerate
  #   vel_x -= Gosu::offset_x(@angle, 0.5)
  #   vel_y -= Gosu::offset_y(@angle, 0.5)
  # end
  
  def  move
    @x += @vel_x
    @y += @vel_y
    @x %= 480
    @y %= 480

    @vel_x *= 0.7
    @vel_y *= 0.7
  end


  def draw
     @image.draw(@x, @y, 1)
  end
end