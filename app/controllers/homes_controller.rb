class HomesController < ApplicationController
  def top
    @products = Product.exposed
  end
end
