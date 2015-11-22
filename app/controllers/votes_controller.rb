class VotesController < ApplicationController
 ## TODO
  before_action :authenticate_user!, only: [:create]

  def create
    @post = Post.find(params[:id])
    vote = @post.votes.find_by(user_id: current_user.id)
    if(vote)
      vote.update(vote: params[:vote])
      redirect_to posts_path(@post)
    else
      @post.votes.new(user_id: current_user.id ,vote: params[:vote])
      if @post.save
        redirect_to posts_path(@post)
      else
        flash[:alert] = @post.errors.full_messages
        redirect_to posts_path(@post)
      end
    end
  end

  def index
    @post = Post.find(params[:id])
    @votes = @post.votes
    render :index
  end

end