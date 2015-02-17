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

  it "destroys any associated images on delete" do
    artist = FactoryGirl.create(:artist)
    artist.images.create()

    expect(Image.count).to eq(1)

    artist.destroy
    expect(Image.count).to eq(0)
  end

  it "deletes selected images" do
    # Create an artist and an image to delete
    artist = FactoryGirl.create(:artist)
    img = artist.images.create()

    # Delete the image by image.id
    artist.delete_image(img.id)
    expect(Image.count).to eq(0)
  end

  it "returns a list of artists" do
    Artist.destroy_all
    FactoryGirl.create(:artist)
    FactoryGirl.create(:artist)

    list = Artist.list
    expect(list.count).to eq(2)
  end
end
