class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :redirect_to_launch_notification_page, :authenticate_user!
  layout :determine_layout

  def redirect_to_launch_notification_page
    redirect_to get_notified_path unless user_signed_in? or devise_controller?
  end

  def determine_layout
    if devise_controller?
      "no_angular"
    else
      "application"
    end
  end
end
