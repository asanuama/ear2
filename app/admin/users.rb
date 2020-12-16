ActiveAdmin.register User do
  permit_params :name, :nickname, :introduction, :image, :is_designer, :homepage, :instagram, :email
  # adminでデータ操作することを許可するparams

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :nickname, :introduction, :image_id, :is_designer, :homepage, :instagram
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :nickname, :introduction, :image_id, :is_designer, :homepage, :instagram]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
