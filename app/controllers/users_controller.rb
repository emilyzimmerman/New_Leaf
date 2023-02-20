class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Account Successfully Created"
      redirect_to root_path 
    else 
      flash[:notice] = "Account Creation Error"
      render :new, status: :unprocessable_entity 
    end
  end

  private 
  def user_params 
    params.require(:user).permit(:username, :email, :password)
  end
end
