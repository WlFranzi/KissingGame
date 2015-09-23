require 'gosu'
require 'kisserin'
require 'pilz'

module Kiss
  class GameWindow < Gosu::Window
    def initialize
      super 480, 480
      self.caption = "Pilz - Kissing"
      @background_image = Gosu::Image.new('media/background.jpg', :tileable => true)
      @kisserin = Kisserin.new(200, 200)
      @pilze = [Pilz.new]
    end

    def update
      if Gosu::button_down? Gosu::KbLeft
        @kisserin.turn_left
      end
      if Gosu::button_down? Gosu::KbRight
        @kisserin.turn_right
      end
      if Gosu::button_down? Gosu::KbUp
        @kisserin.accelerate
      end
      if Gosu::button_down? Gosu::KbDown
        @kisserin.deccelerate
      end
      @kisserin.move
      new_pilz
    end 

    def draw
      @background_image.draw(0, 0, 0)
      @kisserin.draw
      @pilze.each {|pilz| pilz.draw}
    end

    def new_pilz
      @pilze.each do |pilz|
        if @kisserin.collides?(pilz) && @score != 10
          @score += 1
        end
        @pilze.reject!(&:off_screen?)
      end
    end
  end
end
