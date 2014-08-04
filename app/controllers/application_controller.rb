class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  def lock_out
    redirect_to root_path unless user_signed_in?
  end
end
