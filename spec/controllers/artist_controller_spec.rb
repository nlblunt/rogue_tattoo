require 'rails_helper'

RSpec.describe ArtistController do
	before(:each) do
		Artist.destroy_all
	end

	describe "GET 'list'" do
		it "returns the list of artists" do
			FactoryGirl.create(:artist)
			FactoryGirl.create(:artist)

			get :list, format: :json

			expect(assigns(:artists).count).to eq(2)
		end
	end
end