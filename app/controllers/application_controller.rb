class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :lock_out
  before_filter :authenticate_user!

  def lock_out
    redirect_to root_path
  end
end
