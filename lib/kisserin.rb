require 'positionable'

module Kiss
  class Kisserin
    include Positionable
    def initialize(x, y)
      @image = Gosu::Image.new('media/kisserin.png')
      @x = x
      @y = y
      @score = 0
    end

    def turn_left
      @x -= 3
    end

    def turn_right
      @x += 3
    end

    def accelerate
      @y -= 3
    end

    def deccelerate
      @y += 3
    end

    def  move
      @x %= 480
      @y %= 480
    end

    def collides?(pilz)
      pilz.top < bottom &&
      pilz.bottom > top &&
      pilz.left < right &&
      pilz.right > left 
    end

    def score
      @score
    end

    def draw
      @image.draw(@x, @y, 1)
    end
  end
end