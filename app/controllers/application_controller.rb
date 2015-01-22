class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include DeviseTokenAuth::Concerns::SetUserByToken
  respond_to :json
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def lock_out
    redirect_to root_path unless user_signed_in?
  end

  def configure_permitted_parameters 
    devise_parameter_sanitizer.for(:account_update) << [:name, { group_ids: [] }]
  end
end
