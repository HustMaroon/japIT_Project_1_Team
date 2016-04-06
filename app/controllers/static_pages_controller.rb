class StaticPagesController < ApplicationController
  def home
  	@images=Image.all.order('created_at DESC')
  end
  def personal_page
  	@images_of_user = User.find_by(id: current_user.id).images.all.order('created_at DESC')
  end
end
