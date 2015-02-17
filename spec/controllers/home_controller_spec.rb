require 'rails_helper'

RSpec.describe HomeController do #, :type => :controller do
	describe "GET 'dashboard'" do
		describe "Admin logged in" do
			it "returns http success" do
				@admin = FactoryGirl.create(:admin)
				sign_in @admin
				get 'dashboard'
				expect(response).to be_success
				sign_out @admin
			end
		end

		describe "Admin logged out" do
			it "fails to get dashboard, redirects to signup" do
				get 'dashboard'
				expect(response).to redirect_to(new_admin_session_path)	
			end
		end
	end

	describe "GET 'display_images'" do
		it "returns URLs of images with 'diplay=true'" do

		end
	end
end