class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :delete]

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc).page(params[:page]).per(10)
    render :show
  end

  def create
    @post = Post.find(params[:id])
    @post.comments.create(user_id: current_user.id,
                         content: params[:content] )
    redirect_to comments_show_path(@post)
  end

  def delete
    @post =Post.find(params[:post_id])
    user = current_user
    comment = Comment.find(params[:comment_id])
    if comment && (user.id == comment.user.id)
      comment.destroy
      flash[:notice] = "Comment deleted successfully"
    else
      flash[:notice] = "That comment doesn't belong to you!"
    end
    redirect_to comments_show_path(@post)
  end
end