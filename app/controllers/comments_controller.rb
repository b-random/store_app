class CommentsController < ApplicationController

	def create
		@product = Product.find(params[:product_id])
		@comment = @product.comments.new(comment_params)
		#   (comment_params) == (params[:comment])
		@comment.user = current_user
		@comment.save
		redirect_to product_path(@product)
	end

	def destroy
	end

	#not need to index or show because comments will be on the products pages.

	private

	  def comment_params
	  	params.require(:comment).permit(:user_id, :body, :rating)
	  end

end
