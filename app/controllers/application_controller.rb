class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(user)
    user.admin? ? admin_tests_path : root_path
  end

end
