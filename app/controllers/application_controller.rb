class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :authenticate_user!
  layout :determine_layout

  def determine_layout
    if devise_controller?
      "no_angular"
    else
      "application"
    end
  end
end
