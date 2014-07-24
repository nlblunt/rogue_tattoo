require "rails_helper.rb"

RSpec.describe Admin, :type => :model do
  it "creates a new account" do
    # Create an Admin
    @admin = FactoryGirl.create(:admin)
    expect(@admin).to be_valid
  end
end