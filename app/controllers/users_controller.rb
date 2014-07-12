class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_update_params)
      redirect_to root_path, notice: "Profile updated!"
    else
      render :edit
    end
  end

  def index
  end

  private
  def user_update_params
    params.require(:user).permit(:phone_number, :location)
  end

end
