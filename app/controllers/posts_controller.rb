class PostsController < ApplicationController
	include SessionsHelper
	before_action :logged_in_user, only: [:new, :create]

	def new
		@user = User.find_by(remember_digest: User.digest(cookies.permanent[:remember_token]))
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:success] = "Post successfully made!"
			redirect_to root_url
		else
			render 'new'
		end
	end

	def index

	end

	private

		def post_params
			params.require(:post).permit(:author, :content)
		end

		def logged_in_user
			unless logged_in?
				flash[:danger] = "You must log in to create posts."
				redirect_to login_url
			end
		end
end
