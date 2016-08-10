#see Unit tests notes for a step by step primer

require 'rails_helper'

describe Product do

	context "when the product has comments" do
		before do
			@product = Product.create!(name: "beard foam")
			@user = User.create!(first_name: "Jimmy", email: "jimmy@jimmy.com", password: "password")
			#If you ever forget what data to add to a specific model check out your schema.rb file inside the /db directory.
			@product.comments.create!(rating: 1, body: "awesome!", user: @user)
			@product.comments.create!(rating: 3, body: "awesome!", user: @user)
			@product.comments.create!(rating: 5, body: "awesome!", user: @user)
			#can also use dot notation/ 
		end

		it "returns the average rating of all comments" do
			expect(@product.average_rating).to eq 3
			#average_rating defined in model/product.rb
		end
	end

end

