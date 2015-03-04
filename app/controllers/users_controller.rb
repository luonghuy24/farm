class UsersController < ApplicationController
  load_and_authorize_resource

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
      flash[:success] = "Profile updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :avatar)
    end
end
