class ApplicationController < ActionController::Base
  # before_action :basic_auth #Basic認証
  before_action :configure_permitted_parameters, if: :devise_controller?
  


  private

  # def basic_auth #Basic認証
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
  #   end
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :birth_date])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :family_name, :first_name, :birth_date])
  end
end