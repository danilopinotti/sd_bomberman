# Encoding: UTF-8

require 'rubygems'
require 'gosu'

WIDTH, HEIGHT = 600, 600

class GameWindow < Gosu::Window
  def initialize
    super WIDTH, HEIGHT
    
    self.caption = "Gosu Game"

    @background_image = Gosu::Image.new("assets/images/aula/space.bmp", :tileable => true)
    @spaceship = Gosu::Image.new("assets/images/aula/spaceship.png", :tileable => true)
    @x = 300
    @y = 300
    @angle = 0


  end

  def update
  	if Gosu::button_down? Gosu::KbUp then
  		@x += 5 * Math.sin(@angle * Math::PI / 180);
		@y -= 5 * Math.cos(@angle * Math::PI / 180);
  	end
  	
  	if Gosu::button_down? Gosu::KbRight then
  		@angle += 5
  	end
  	
  	if Gosu::button_down? Gosu::KbLeft then
  		@angle -= 5
  	end
  end

  def draw
  	@background_image.draw(0, 0, 0)
  	#@spaceship.draw(300,@y,1,0.2,0.2)
  	@spaceship.draw_rot(@x, @y, 1, @angle, 0.5, 0.5, 0.2, 0.2)
  		
  end
  	
end

GameWindow.new.show if __FILE__ == $0

