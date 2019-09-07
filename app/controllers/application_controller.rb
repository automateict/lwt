class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  respond_to :html, :js, :json
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :set_layout

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [person_attributes: [:id, :first_name, :father_name, :grand_father_name]])
  end

  def set_layout
    unless current_user
    return 'guest'
  else
   return 'application'
    end
  end
end
