class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :congfigure_permitted_parameters, if: :devise_controller?

  def congfigure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
