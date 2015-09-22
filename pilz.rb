class Pilz
  
  def initialize
    @img = Gosu::Image.new("media/pilz.png")
    move
  end

  def move
    @x = rand * 480-@img.width
    @y = rand * 480-@img.height
  end

  def draw  
    @img.draw(@x, @y, 1)
  end
end