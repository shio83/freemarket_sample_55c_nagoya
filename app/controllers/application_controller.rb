class ApplicationController < ActionController::Base
  before_action :set_parents
  before_action :basic_auth, if: :production?

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    root_path 
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  # end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
  

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end
