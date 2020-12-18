class ProductsController < ApplicationController
 before_action :ensure_correct_user, only: [:edit, :update, :destroy, :hideen_change]
  
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
    if params[:tag_name]
      @products = Product.exposed.tagged_with("#{params[:tag_name]}").page(params[:page]).per(15)
    elsif params[:is_pierce] == "true"
      @products = Product.exposed.pierce.page(params[:page]).per(15)
      @word = 'ピアス'
    elsif params[:is_pierce] == "false"
      @products = Product.exposed.nonhole_pierce.page(params[:page]).per(15)
      @word = 'イヤリング'
    elsif params[:is_allergiefree] == "true"
      @products = Product.exposed.allergiefree.page(params[:page]).per(15)
      @word = 'アレルギーフリー商品'
    elsif params[:is_sold_one] == "true"
      @products = Product.exposed.sold_one.page(params[:page]).per(15)
      @word = '片方のみ販売可能商品'
    else
      @products = Product.exposed.page(params[:page]).per(15)
      @word = '全商品'
    end
  end

  def show
    @product = Product.find(params[:id])
    user = @product.user
    random = "RANDOM()"
    if Rails.env.production?
      random = "rand()"
    end
    @products = user.products.exposed.where.not(id:@product.id).order(random).limit(3)
    # @products = user.products.exposed.where.not(id:@product.id).order("RANDOM()").limit(3)
    @product_comment = ProductComment.new
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
  
  def destroy
    @product.destroy
    flash[:notice] = "商品情報を削除しました"
    redirect_to user_my_page_path(current_user)
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
    params.require(:product).permit(:name, :explanation, :image, :price, :is_pierce, :is_sold_one, :is_hidden, :is_allergiefree, :tag_list)
  end
  
  def ensure_correct_user
    @product = Product.find(params[:id])
    unless @product.user == current_user
      redirect_to productss_path
    end
  end
end
