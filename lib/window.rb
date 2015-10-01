require 'gosu'
require 'kisserin'
require 'pilz'


module ZOrder
  Background, Pilz, Kisserin, UI = *0..3
end

module Kiss
  class GameWindow < Gosu::Window
    def initialize
      super 800, 800
      self.caption = "Pilz - Kissing"
      @background_image = Gosu::Image.new('media/background.jpg', :tileable => true)
      @font = Gosu::Font.new(30)
      @kisserin = Kisserin.new(200, 200)
      @pilze = [Pilz.new, Pilz.new]
      Gosu::Sample.new("media/happymusic.mp3").play
      @background_animation = Gosu::Image.new('media/really?.jpg', :tileable => true)
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
      increment_pilz
      @pilze.each(&:update)
    end 

    def draw
      @background_image.draw(0, 0, 0) if @kisserin.score < 101
      @background_animation.draw(0, 0, 4) if @kisserin.score >= 101
      @kisserin.draw 
      @pilze.each(&:draw)
      @font.draw("Score: #{@kisserin.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xffff00ff)
    end
    
    def increment_pilz
      @pilze.each do |pilz|
        if @kisserin.collides?(pilz) && @kisserin.score != 100 && !pilz.kissed?
          @kisserin.increment_score 
          pilz.kissed!
          @pilze.push(Pilz.new) 
        end
      end
    end
  end
end
