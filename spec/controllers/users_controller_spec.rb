require 'rails_helper'

describe UsersController, :type => :controller do 
	let(:user) { User.create!(email: "peter@example.com", password: "password") }
	#this is the before block

	describe "GET #show" do

    context "User is logged in" do
    	before do
        sign_in user
    	end
	    	it "loads correct user details" do
	        get :show, id: user
	        expect(assigns(:user)).to eq user
	    	end

    end

    context "No user is logged in" do 
    	it "redirects to login" do
        get :show, id: user.id
        expect(response).to redirect_to(root_path)
    	end
    end

  end

end