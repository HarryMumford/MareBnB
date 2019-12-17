feature 'create and view listings' do

  scenario 'user redirects to listings/new' do
    visit '/listings'
    click_button 'add_new_listing'

    expect(current_path).to eq('/listings/new')
  end

  scenario 'user can create and view their listing' do
    visit '/listings/new'
    fill_in 'listing_name', with: 'Test Listing 1'
    fill_in 'listing_description', with: 'i am a test description of test listing 1'
    click_button 'post_listing'

    expect(current_path).to eq('/listings')
    expect(page).to have_content("Test Listing 1", "i am a test description of test listing 1")
  end

end
