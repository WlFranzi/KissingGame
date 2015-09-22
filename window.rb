require 'gosu'
require_relative 'kisserin'
require_relative 'pilz'


  module ZOrder
  Background, Pilz, Kisserin, UI = *0..3
  end


class GameWindow < Gosu::Window
  def initialize
    super 480, 480
    self.caption = "Kiss the Frog Game"
    @background_image = Gosu::Image.new('media/background.jpg', :tileable => true)
    @kisserin = Kisserin.new(200, 200)
    @pilze = Pilz.new
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
  end


  def draw
    @background_image.draw(0, 0, 0)
    @kisserin.draw
    @pilze.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
    end
  end
end

window = GameWindow.new
window.show

