class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def signed_in_root_path(resource)
    stored_location_for(resource) ||
    if resource.is_a?(Grupo)
      "/home"
    elsif resource.is_a?(Admin)
      "/admin/home"
    else
      super
    end
  end

   protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

end
