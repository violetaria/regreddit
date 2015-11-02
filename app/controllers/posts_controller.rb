class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def new
		post = Post.new
		render :new
	end

	def create
		post = current_user.posts.create(title: params[:title],
                                     url: params[:url])
    	redirect_to posts_path(post)
	end

	def index
		@posts = Post.order("created_at DESC").page(params[:page]).per(10)
    	render :index
	end

	def show

	end

end