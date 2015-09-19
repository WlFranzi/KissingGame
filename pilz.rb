class Pilz
 # attr_reader :x, :y

  def initialize
    #@animation = animation
    @img = Gosu::Image.new('media/pilz.png')
    @x = rand * 480
    @y = rand * 480
  end

  def draw  
   # img = @animation[Gosu::milliseconds / 100 % @animation.size];
    #@animation[Gosu::milliseconds / 100% @animation.size]
    @img.draw(@x, @y, 1)
  end
end