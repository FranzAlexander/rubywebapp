class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, except: %i[new create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create #Creating the user account admin is set to false and then admin will have to change it to the database.
    @user = User.new(user_params)
    @user.admin = 0
    if @user.save
      redirect_to login_path
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    #Old code for feature that isnt there anymore.
    @user = User.find(params[:id])
    if @user.update_attributes(update_params)
      redirect_to users_path, :id => @user
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy #Not code that works dude to admin being only able to delete accounts in the database.
    @user.destroy
    respond_to do |format|
      format.html { redirect_to home_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params #What is needed to successfully create a user account.
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def update_params
      params.require(:user).permit(:name, :email, :admin)
    end

end
