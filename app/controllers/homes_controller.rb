class HomesController < ApplicationController
  def top
    #@products = Product.exposed.order("RANDOM()")
    random = "RANDOM()"
    if Rails.env.production?
      random = "rand()"
    end
    @products = Product.exposed.order(random)
  end
end
