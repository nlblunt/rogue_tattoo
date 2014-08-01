require 'rails_helper'

RSpec.describe Makeupartist, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:makeupartist)).to be_valid
  end
  
  it "is invalid without a name" do
    expect(FactoryGirl.build(:makeupartist, name: nil)).not_to be_valid
  end

  it "destroys any associated images on delete" do
    makeupartist = FactoryGirl.create(:makeupartist)
    makeupartist.makeupimages.create()

    expect(Makeupimage.count).to eq(1)

    makeupartist.destroy
    expect(Makeupimage.count).to eq(0)
  end

  it "adds a new image"

  it "deletes selected images" do
    # Create an artist and an image to delete
    makeupartist = FactoryGirl.create(:makeupartist)
    img = makeupartist.makeupimages.create()
    expect(Makeupimage.count).to eq(1)
    
    # Delete the image by image.id
    makeupartist.delete_makeupimage(img.id)
    expect(Makeupimage.count).to eq(0)
  end
end
