class StaticPagesController < ApplicationController
  def home
  	@images=Image.all.order('created_at DESC')
  end
  def personal_page
  	@images_of_user = User.find_by(id: current_user.id).images.all.order('created_at DESC')
  	@avatar = User.find_by(id: current_user.id)
  end
  def user_page
  	@user_pg = User.find_by(id: params[:id])
  	@images_of_user = User.find_by(id: params[:id]).images.all.order('created_at DESC')
  end
end
