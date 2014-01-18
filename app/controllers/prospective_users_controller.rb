class ProspectiveUsersController < ApplicationController
  skip_before_filter :redirect_to_launch_notification_page, :authenticate_user!
  layout 'no_angular'

  # GET /prospective_users/new
  def new
    @prospective_user = ProspectiveUser.new
  end

  # POST /prospective_users
  # POST /prospective_users.json
  def create
    @prospective_user = ProspectiveUser.new(prospective_user_params)

    respond_to do |format|
      if @prospective_user.save
        format.html { redirect_to action: 'thanks' }
        format.json { render action: 'show', status: :created, location: @prospective_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @prospective_user.errors, status: :unprocessable_entity }
      end
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
