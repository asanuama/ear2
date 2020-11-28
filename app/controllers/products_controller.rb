class ProductsController < ApplicationController

  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      flash[:notice] = "商品を登録しました"
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end
  
  def index
      # パラメータにユーザID含まれてたらそのユーザのproductのみ表示
    if params[:user_id]
		  @products = current_user.products.order(created_at: :desc).all
    else
      # IDなければ、非表示モードでない全件表示
      @products = Product.exposed.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "商品情報を更新しました"
      redirect_to product_path(params[:id])
    else
      render 'edit'
    end
  end
  
   
  def hideen_change
    product = Product.find(params[:id])
    if product.is_hidden== false
      product.update(is_hidden: true)
      flash[:notice] = "商品を非表示に設定しました"
    else
      product.update(is_hidden: true)
      flash[:notice] = "商品を表示する設定に変更しました"
    end
    redirect_to product_path(product)
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :explanation, :image, :price, :is_pierce, :is_sold_one, :is_hidden, :is_allergiefree )
  end
end
