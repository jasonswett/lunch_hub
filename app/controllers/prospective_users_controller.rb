class ProspectiveUsersController < ApplicationController
  before_action :set_prospective_user, only: [:show, :edit, :update, :destroy]

  # GET /prospective_users
  # GET /prospective_users.json
  def index
    @prospective_users = ProspectiveUser.all
  end

  # GET /prospective_users/1
  # GET /prospective_users/1.json
  def show
  end

  # GET /prospective_users/new
  def new
    @prospective_user = ProspectiveUser.new
  end

  # GET /prospective_users/1/edit
  def edit
  end

  # POST /prospective_users
  # POST /prospective_users.json
  def create
    @prospective_user = ProspectiveUser.new(prospective_user_params)

    respond_to do |format|
      if @prospective_user.save
        format.html { redirect_to @prospective_user, notice: 'Prospective user was successfully created.' }
        format.json { render action: 'show', status: :created, location: @prospective_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @prospective_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prospective_users/1
  # PATCH/PUT /prospective_users/1.json
  def update
    respond_to do |format|
      if @prospective_user.update(prospective_user_params)
        format.html { redirect_to @prospective_user, notice: 'Prospective user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @prospective_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prospective_users/1
  # DELETE /prospective_users/1.json
  def destroy
    @prospective_user.destroy
    respond_to do |format|
      format.html { redirect_to prospective_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prospective_user
      @prospective_user = ProspectiveUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prospective_user_params
      params.require(:prospective_user).permit(:first_name, :email)
    end
end
