class RegistrationsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(username: params[:username],
                     email: params[:email],
                     password: params[:password])
    if @user.save
      flash[:notice] = "User #{params[:username]} created successfully"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

end