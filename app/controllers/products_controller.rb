class ProductsController < ApplicationController
 before_action :ensure_correct_user, only: [:edit, :update, :destroy, :hideen_change]
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      # delete(" ")で文字列から全ての空白を削除する
      # split(",")で受け取った文字列をカンマ（,）区切りで配列にする
      tag_list = tag_params[:tag_name].split(nil)
      # Article.rb に save_tags()メソッドを定義
      @product.save_tags(tag_list)
      flash[:notice] = "商品を登録しました"
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end
  
  def index
      # パラメータにユーザID含まれてたらそのユーザのproductのみ表示
    # if params[:user_id]
    #   user = User.find(params:[user_id])
		  # @products = user.products.order(created_at: :desc).all
    # else
      # IDなければ、非表示モードでない全件表示
      @products = Product.exposed.page(params[:page]).per(15)
      
    # end
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
    params.require(:product).permit(:name, :explanation, :image, :price, :is_pierce, :is_sold_one, :is_hidden, :is_allergiefree )
  end
  
  # タグ用にストロングパラメータを設定して、文字列を受け取る
  def tag_params
    params.require(:product).permit(:tag_names)
  end
  
  def ensure_correct_user
    @product = Product.find(params[:id])
    unless @product.user == current_user
      redirect_to productss_path
    end
  end
end
