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
    @kisserin = Kisserin.new
    @kisserin.warp(520, 240)
    @pilz = Pilz.new
  end

  def update
    if Gosu::button_down? Gosu::KbLeft
      then @kisserin.turn_left
    end
    if Gosu::button_down? Gosu::KbRight
      then @kisserin.turn_right
    end
    if Gosu::button_down? Gosu::KbUp
      then @kisserin.accelerate
    end
    # if Gosu::button_down? Gosu::KbUp
    #   then @kisserin.deccelerate
    # end
    @kisserin.move
  end

  def draw
    @kisserin.draw
    @pilz.draw
    @background_image.draw(0, 0, 0)
    
  end

  def button_down(id)
    if id == Gosu::KbEscape
    end
  end
end

window = GameWindow.new
window.show

