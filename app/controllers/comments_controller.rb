class CommentsController < ApplicationController
 ## TODO
  before_action :authenticate_user!, only: [:create]

  def show
    @post = Posts.find(id: params[:id])
    @comments = @post.comments
    render :show
  end

  def create
    @post = Posts.find(id: params[:id])
    @post.comments.create(user_id: current_user.id,
                         content: :content )
    redirect_to posts_path(@post)
  end

end