class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end
  
  def create
    @product = Product.find(params[:product_id])
    favorite = @product.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @product = Product.find(params[:product_id])
    favorite = @product.favorites.find_by(user_id: current_user.id)
    favorite.destroy
  end
end
