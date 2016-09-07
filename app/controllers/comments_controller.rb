class CommentsController < ApplicationController

	def create
		@product = Product.find(params[:product_id])
		@comment = @product.comments.new(comment_params)
		#        = this products new comment with attr set in private action comment_params
		@comment.user = current_user
		respond_to do |format|
      if @comment.save
      	ActionCable.server.broadcast 'product_channel', comment: @comment
        format.html { redirect_to @product, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
        format.js #added for AJAX requests
      else
        format.html { redirect_to @product, alert: 'Review was NOT saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
		@comment = Comment.find(params[:id])
		product = @comment.product
		@comment.destroy
		redirect_to product
	end

	#not need to index or show because comments will be on the products pages.

	private

	  def comment_params
	  	params.require(:comment).permit(:user_id, :body, :rating)
	  end

end
