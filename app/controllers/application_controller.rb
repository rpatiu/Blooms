class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  add_breadcrumb "Home", :root_path


  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    attributes = [:name, :email, :address, :province_id]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
