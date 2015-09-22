require 'forwardable'


module Kisserin
  module Positionable
    attr_reader :x, :y  
    alias :top :y
    alias :left :x

    extend Forwardable
    def_delegator :@image, :height, :width

    def bottom
      y + height
    end

    def right
      x + width
    end
  end
end

