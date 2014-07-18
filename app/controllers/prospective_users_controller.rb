class ProspectiveUsersController < ApplicationController
  skip_before_filter :lock_out
  skip_before_filter :authenticate_user!

  # GET /prospective_users/new
  def new
    @prospective_user = ProspectiveUser.new
  end

  # POST /prospective_users
  # POST /prospective_users.json
  def create
    @prospective_user = ProspectiveUser.new(prospective_user_params)

    if @prospective_user.save
      render json: @prospective_user
    else
      render json: @prospective_user.errors, status: :unprocessable_entity
    end
  end

  def thanks
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def prospective_user_params
      params.require(:prospective_user).permit(:first_name, :email)
    end
end
