class RegistrationsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.create(username: params[:username],
                email: params[:email],
                password: params[:password])

    binding.pry
    redirect_to root_path
  end

  def index
    render :index
  end
end