require 'positionable'

module Kiss
  class Pilz
    include Positionable
    def initialize
      @image = Gosu::Image.new("media/pilz.png")
      move
    end

    def move
      @x = rand(480 - width)
      @y = rand(480 - height)
    end

    def draw  
      @image.draw(@x, @y, 1)
    end

    def off_screen?
      pilz.x > window.x &&
      pilz.y > window.y
    end
  end
end