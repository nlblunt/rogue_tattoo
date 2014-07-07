require "rails_helper.rb"

#require "spec_helper.rb"
#require "artist.rb"

describe Artist do
  it "has a valid factory" do
    expect(FactoryGirl.create(:artist)).to be_valid
  end
  
  it "is invalid without a name" do
    #FactoryGirl.build(:artist, name: nil).should_not be_valid
    expect(FactoryGirl.build(:artist, name: nil)).not_to be_valid
  end
  
  it "is invalid without a bio" do
    expect(FactoryGirl.build(:artist, bio: nil)).not_to be_valid
  end
end
