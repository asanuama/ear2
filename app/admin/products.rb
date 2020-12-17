ActiveAdmin.register Product do
  permit_params :name, :explanation, :image, :price, :is_pierce, :is_sold_one, :is_hidden, :is_allergiefree, :tag_list

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :explanation, :image_id, :price, :is_pierce, :is_sold_one, :is_hidden, :user_id, :is_allergiefree, :tag_list
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :explanation, :image_id, :price, :is_pierce, :is_sold_one, :is_hidden, :user_id, :is_allergiefree, :tag_list]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
