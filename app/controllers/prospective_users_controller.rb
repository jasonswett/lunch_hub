class ProspectiveUsersController < ApplicationController
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
        format.html { redirect_to root_path, notice: 'Prospective user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @prospective_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @prospective_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def prospective_user_params
      params.require(:prospective_user).permit(:first_name, :email)
    end
end
