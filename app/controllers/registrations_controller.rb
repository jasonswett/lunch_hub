class RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_filter -> { params[:group_ids] ||= [] }, only: [:update]
end
