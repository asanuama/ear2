class ProductCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @product = Product.find(params[:id])
    @product_comment = Productcomment.new(product_comment_params)
    @product_comment.product_id = @product.id
    @product_comment.user_id = current_user.id
    if !@product_comment.save
      render 'product/show'
    end  
  end
  
  def destoroy
    @product = Product.find(params[:id])
    product_comment = @product.product_comment.find(params[:id])
    product_comment.destoroy
    redirect_to request.referer
  end
  
  private
	def product_comment_params
		params.require(:book_comment).permit(:comment)
	end
  
end
