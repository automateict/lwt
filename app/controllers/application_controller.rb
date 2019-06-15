class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  respond_to :html, :js, :json

  layout :set_layout

  private

  def set_layout
    if !user_signed_in? or (user_signed_in? and current_user.has_role('User'))
      'application'
    else
      'application'
    end
  end

end
