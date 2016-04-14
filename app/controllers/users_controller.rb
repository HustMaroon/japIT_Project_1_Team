class UsersController < ApplicationController
	def show
		@user = User.find_by(id: params[:id])
		@images_of_user = User.find_by(id: params[:id]).images.all.order('created_at DESC')
	end
   before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end
