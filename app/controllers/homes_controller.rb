class HomesController < ApplicationController
  def top
    @products = Product.exposed.order("RANDOM()")
  end
end
