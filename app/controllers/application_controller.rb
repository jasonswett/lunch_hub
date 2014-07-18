class ApplicationController < ActionController::API
  before_filter :set_cors_headers
  before_filter :cors_preflight

  def lock_out
    redirect_to root_path unless user_signed_in?
  end

  def set_cors_headers
    headers['Access-Control-Allow-Origin'] = AppConfig.client['origin']
    headers['Access-Control-Allow-Methods'] = 'GET,POST,PUT,DELETE,OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*'
    headers['Access-Control-Max-Age'] = "3628800"
  end

  def cors_preflight
    head(:ok) if request.method == :options
  end
end
