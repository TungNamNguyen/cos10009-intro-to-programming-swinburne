require 'rubygems'
require 'gosu'
require './circle'

# The screen has layers: Background, middle, top
module ZOrder
  BACKGROUND, MIDDLE, TOP = *0..2
end

class DemoWindow < Gosu::Window
  def initialize # ve cai khung
    super(640, 400, false)
  end

  def draw 
    # see www.rubydoc.info/github/gosu/gosu/Gosu/Color for colours
    draw_quad(0, 0, 0xff_ffffff, 640, 0, 0xff_ffffff, 0, 400, 0xff_ffffff, 640, 400, 0xff_ffffff, ZOrder::BACKGROUND)
   
    draw_triangle(350,100 , Gosu::Color::GREEN, 200, 250, Gosu::Color::GREEN, 500, 250, Gosu::Color::GREEN, ZOrder::MIDDLE, mode=:default)
   
    # draw_rect works a bit differently:
    Gosu.draw_rect(250,250 , 200, 200, Gosu::Color::GRAY, ZOrder::TOP, mode=:default)

    # Circle parameter - Radius
    img2 = Gosu::Image.new(Circle.new(50))
    # Image draw parameters - x, y, z, horizontal scale (use for ovals), vertical scale (use for ovals), colour
    # Colour - use Gosu::Image::{Colour name} or .rgb({red},{green},{blue}) or .rgba({alpha}{red},{green},{blue},)
    # Note - alpha is used for transparency.
    # drawn as an elipse (0.5 width:)
    # drawn as a red circle:
    img2.draw(80, 20, ZOrder::TOP, 1.0, 1.0, 0xff_ff0000)
    
    

  end
end

DemoWindow.new.show

