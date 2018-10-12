class UsersController < ApplicationController

	def new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			#login(@user)
			remember(@user)
			flash[:success] = "Account successfully created"
			redirect_to root_url
		else
			render 'new'
		end
	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password,
										 :password_confirmation)
		end
end
