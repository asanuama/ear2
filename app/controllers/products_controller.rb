class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "商品を登録しました"
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end
  
  

  def index
  end

  def show
  end

  def edit
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :explanation, :image, :price, :is_pierce, :is_sold_one, :is_hidden, :user_id)
  end
end
