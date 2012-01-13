Rails::Engine.mixin __FILE__
class User < ActiveRecord::Base
  def tacos
    puts "tacos11"
  end
end