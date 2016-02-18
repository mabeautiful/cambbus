class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		if @user.save
			#flash[:success] = "You have signed up successfully #{{@user.username}}"
			redirect_to posts_path
		else
			render 'new'
		end
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to posts_path
		else		
			render 'edit'
		end
	end
	def show
		@user = User.find(params[:id])
		@user_all = @user.posts.paginate(page: params[:page], per_page: 1)
	end
	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end