
class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by!(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_path
    else
      redirect_to login_path
       flash[:notice] = "Password and User not correct. Please Login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to posts_path
  end
end