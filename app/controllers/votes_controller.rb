class VotesController < ApplicationController
 ## TODO
  before_action :authenticate_user!, only: [:create]

  def create
    @post = Post.find(params[:id])
    @post.votes.new(user_id: current_user.id ,vote: params[:vote])
    if @post.save
      redirect_to posts_path(@post)
    else
      flash[:alert] = "You can only vote once!"
      redirect_to posts_path(@post)
    end
  end

  def index
    @post = Post.find(params[:id])
    @votes = @post.votes
    render :index
  end

end