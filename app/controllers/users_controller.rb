class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
  	@users = User.all.asc(:username).page(params[:page])
  end

  def show
  	@user = User.find(params[:id])
  end

  def destroy
  	redirect_to root_path
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      sign_in(@user, :bypass => true)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:message] = 'Created new user successful'
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :avatar)
    end
end
