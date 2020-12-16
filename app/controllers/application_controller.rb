class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
   
  private
  def after_sign_in_path_for(resource)
    case resource 
      when User
        user_my_page_path(resource)
      when Admin
        admin_admin_users_path(resource)
    end
  end
    
  def after_signout_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :is_designer])
  end
end
