class CommentsController < ApplicationController
 ## TODO
  before_action :authenticate_user!, only: [:create]

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)
    render :show
  end

  def create
    @post = Post.find(params[:id])
    @post.comments.create(user_id: current_user.id,
                         content: params[:content] )
    redirect_to comments_show_path(@post)
  end

end