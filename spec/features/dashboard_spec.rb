describe "accessing the dashboard", :type => :feature do 
	it 'valid credentials signs in' do 
		admin = FactoryGirl.create(:admin)

		visit(dashboard_path)
		expect(current_path).to eq(new_admin_session_path)

		fill_in 'Email', :with => admin.email
		fill_in 'Password', :with => admin.password

		click_button 'Sign in'
		expect(page).to have_content 'Signed in successfully'

		visit(dashboard_path)
		expect(current_path).to eq(dashboard_path)
	end

	it 'invalid credentials fails sign in' do
		visit(dashboard_path)
		expect(current_path).to eq(new_admin_session_path)

		fill_in 'Email', :with => "email@email.com"
		fill_in 'Password', :with => "password"

		click_button 'Sign in'
		expect(page).not_to have_content 'successfully'
	end
end

describe 'adding a new artist', :type => :feature do
	before :each do
		@admin = FactoryGirl.create(:admin)

		visit(new_admin_session_path)
		fill_in 'Email', :with => @admin.email
		fill_in 'Password', :with => @admin.password
		#fill_in :password_confirmation, :with => 'password'

		click_button 'Sign in'
		expect(page).to have_content 'Signed in successfully'
	end

	it 'provided valid artist params', :js => true do

		visit(dashboard_path)

		click_on 'Add New Artist'
		#expect(current_path).to eq(new_artist_path)

		fill_in 'artist_name', :with => "John"
		fill_in 'artist_bio', :with => "Some Bio"

		click_on 'Create Artist'

		expect(page).to have_content 'John'
	end

	it 'provided invalid artist params', :js => true do

		visit(dashboard_path)

		click_on 'Add New Artist'
		#expect(current_path).to eq(new_artist_path)

		fill_in 'artist_name', :with => nil
		fill_in 'artist_bio', :with => "Some Bio"

		click_on 'Create Artist'

		expect(page).not_to have_content 'Betty12'
	end
end

describe 'adding a new makeup artist', :type => :feature do
	before :each do
		@admin = FactoryGirl.create(:admin)

		visit(new_admin_session_path)
		fill_in 'Email', :with => @admin.email
		fill_in 'Password', :with => @admin.password
		#fill_in :password_confirmation, :with => 'password'

		click_button 'Sign in'
		expect(page).to have_content 'Signed in successfully'
	end

	it 'provided valid makeup artist params', :js => true do

		visit(dashboard_path)

		click_on 'Add New Makeup Artist'
		#expect(current_path).to eq(new_artist_path)

		fill_in 'makeupartist_name', :with => "Jill"
		fill_in 'makeupartist_bio', :with => "Some Bio"

		click_on 'Create Makeupartist'

		expect(page).to have_content 'Jill'
	end

	it 'provided invalid makeup artist params', :js => true do

		visit(dashboard_path)

		click_on 'Add New Makeup Artist'
		#expect(current_path).to eq(new_artist_path)

		fill_in 'makeupartist_name', :with => nil
		fill_in 'makeupartist_bio', :with => "Some Bio"

		click_on 'Create Makeupartist'

		expect(page).not_to have_content 'Betty12'
	end
end