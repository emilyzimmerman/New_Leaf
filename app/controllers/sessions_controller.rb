class SessionsController < ApplicationController
#GET login Page
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Login Successful"
      redirect_to root_path
    else 
      flash[:notice] = "Login Failed"
      render :new, status: :unprocessable_entity
    end
  end
end
