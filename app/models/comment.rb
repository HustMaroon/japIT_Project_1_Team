class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :image
  default_scope -> {order(created_at: :desc)}

  private
  def picture_size
  	if picture.size > 5.megabytes
  		errors.add(:picture, "should be less than 5MB")
  	end
  end
end
