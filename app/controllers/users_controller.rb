class UsersController < ApplicationController
  def index
    @users = User.designer.page(params[:page]).per(15)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザ情報を更新しました"
      redirect_to user_my_page_path(@user)
    else
      render 'user/edit'
    end
  end

  def my_page
  end
  
  def mode_select
  end

  def mode_change
    if current_user.is_designer == false
      current_user.update(is_designer: true)
      flash[:notice] = "designerモードに変更しました。空白の項目がある場合は入力をしてください"
    else
      current_user.update(is_designer: false)
      flash[:notice] = "viewerモードに変更しました"
    end
    redirect_to user_my_page_path(current_user)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :nickname, :introduction, :image, :is_designer, :homepage, :instagram, :email, :user_id)
  end

end
