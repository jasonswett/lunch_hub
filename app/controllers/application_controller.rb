class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :authenticate_user!
  before_filter :lock_out

  def lock_out
    redirect_to root_path unless user_signed_in?
  end
end
