class CommentsController < ApplicationController
before_action :logged_in_user, only: [:create]
	def create
		@image = Image.find(params[:image_id])
		@comment = @image.comments.build(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			respond_to do |format|
				format.html do
					redirect_to @image
				end
				format.js
			end
	    else
			flash[:warning]= "You can not comment on this post"
	    end
	end

	def destroy
		@comment = Comment.find_by(params[:id])
		@image = @comment.image
		@delete_id = @comment.id
		@comment.destroy
		respond_to do |format|
			format.html do
				redirect_to @cmicropost
			end
			format.js
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:content, :image_id, :picture)
	end

	def logged_in_user
		!current_user.nil?
	end
end
