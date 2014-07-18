class ApplicationController < ActionController::API
  def lock_out
    redirect_to root_path unless user_signed_in?
  end
end
