class RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|      
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
  end
end
