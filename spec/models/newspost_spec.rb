require "rails_helper.rb"
require "./app/models/newspost.rb"

describe Newspost do
  it "has a valid factory" do
    expect(FactoryGirl.create(:newspost)).to be_valid
  end
  
  it "is invalid without a heading" do
    expect(FactoryGirl.build(:newspost, heading: nil)).not_to be_valid
    #FactoryGirl.build(:newspost, heading: nil).should_not be_valid
  end
  
  it "is invalid without a body" do
    expect(FactoryGirl.build(:newspost, body: nil)).not_to be_valid
    #FactoryGirl.build(:newspost, body: nil).should_not be_valid
  end
end
