class PaymentsController < ApplicationController
	def create
   
    @product = Product.find(params[:product_id])
    @price = (@product.price.tr("$","").to_f * 100).to_i
		@user = current_user
		token = params[:stripeToken]

		  begin
		  	charge = Stripe::Charge.create(
          :amount => @price, # amount in cents, again
          :currency => "usd",
          :source => token,
          :description => params[:stripeEmail]
        )
		  

		  if charge.paid
		    Order.create(
          :product_id => @product_id,
    			:user_id => @user_id,
    			:total => @price
		    	)	

		    flash[:success] = "Payment successful"
 
  			redirect_to product_path(@product)
		  end
		    
      rescue Stripe::CardError => e
        # The card has been declined
        body = e.json_body
    		err = body[:error]
    		flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
 
  			redirect_to product_path(@product)
      end  
	end
end
