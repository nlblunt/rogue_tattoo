describe "home page", :type => :feature do
	before :all do
		@artist = FactoryGirl.create(:artist, :name => "Artist Name")
	end

	it 'displays artist in menu' do
		#FactoryGirl.create(:artist, :name => "ArtistName")
		visit(root_path)

		expect(page).to have_content 'Artist Name'
	end

	it 'shows artist page' do
		#artist = FactoryGirl.create(:artist, :name => "ArtistName")
		visit(root_path)

		click_on('Artist Name')
		expect(current_path).to eq(artist_path(@artist))
	end

	it 'displays makeupartist in menu' do
		FactoryGirl.create(:makeupartist, :name => "MakeupArtistName")
		visit(root_path)

		expect(page).to have_content 'MakeupArtistName'
	end
end