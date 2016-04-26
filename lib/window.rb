require 'gosu'
require 'kisserin'
require 'pilz'


module ZOrder
  Background, Pilz, Kisserin, UI = *0..3
end

module Kiss
  class GameWindow < Gosu::Window
    def initialize
      super 1000, 500
      self.caption = "Pilz - Kissing"
      @background_image = Gosu::Image.new('media/grass.jpg', :tileable => true)
      @font = Gosu::Font.new(30)
      @font_over = Gosu::Font.new(60)
      @kisserin = Kisserin.new(200, 200)      
      @font_time = Gosu::Font.new(120)
      @pilze = [Pilz.new, Pilz.new]
      Gosu::Sample.new("media/happymusic.mp3").play
      @background_animation = Gosu::Image.new('media/really?.jpg', :tileable => true)
      @countdown = 2000
      @start_time = Time.now
      @game_over = false
      @angle = 0
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
      if @kisserin.score >= 101 || time_passing <= 0
        @game_over = true
      end
      @angle += 10
    end 

    def draw
      if @game_over && @kisserin.score != 5
        @background_animation.draw_rot(400, 400, 1, @angle, 0.5, 0.5, 2, 2)
        @font_over.draw("GAME OVER - try it again!", 110, 380, ZOrder::UI, 1.0, 1.0, 0xff_000000) if Time.now.to_i.even?
      elsif @kisserin.score >= 5
        @background_animation.draw_rot(400, 400, 1, @angle, 0.5, 0.5, 2, 2)
        @font_over.draw("WOOOOOOON! Wooohoo", 210, 380, ZOrder::UI, 1.0, 1.0, 0xff_000000) if Time.now.to_i.even?
      else
        @background_image.draw(0, 0, 0) 
        @kisserin.draw 
        @pilze.each(&:draw)
        @font.draw("Score: #{@kisserin.score}", 10, 10,  ZOrder::UI, 1.0, 1.0, 0xffff00ff)
        @font_time.draw("#{time_passing}", 400, 30, ZOrder::UI, 1.0, 1.0, 0xffff00ff)
      end
    end

    def time_passing
      (10 - (Time.now - @start_time)).to_i
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
