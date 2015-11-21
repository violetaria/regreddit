class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index]

	def new
		@post = Post.new
		render :new
	end

	def create
		post = current_user.posts.new(title: params[:title],
																	url: params[:url])
		if post.save
			redirect_to posts_path(post)
		else
			flash[:errors] = post.errors.full_messages
			redirect_to posts_path(post)
		end
	end

	def index
		@posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(10)
    	render :index
	end

	def show
		@posts = current_user.posts.page(params[:page]).per(10)
		render :show
	end

  def delete
		@post = Post.find(params[:id])
		user = current_user
		if user.id == @post.user.id
			@post.destroy
			flash[:notice] = "Post deleted successfully"
			@posts = Post.page(params[:page]).per(10)
			redirect_to posts_path(@posts)
		else
			flash[:alert] = "That post doesn't belong to you!"
			redirect_to comments_show_path(@post)
		end
	end

end