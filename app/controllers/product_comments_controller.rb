class ProductCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @product = Product.find(params[:id])
    @product_comment = Product_comment.new(product_comment_params)
    @product_comment.product_id = @product.id
    @product_comment.user_id = current_user.id
    if !@product_comment.save
      render 'product/show'
    end  
  end
  
  def destoroy
  end
  
  private
	def product_comment_params
		params.require(:book_comment).permit(:comment)
	end
  
end
