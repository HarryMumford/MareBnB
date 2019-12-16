feature 'create and view listings' do

  scenario 'lodger can view all created listings' do
    visit '/listings/new'
    fill_in 'listing_name', with: 'Test Listing 1'
    fill_in 'listing_description', with: 'i am a test description of test listing 1'
    click_button 'post_listing'

    expect(current_path).to eq('/listings')
    expect(page).to have_content("Test Listing 1", "i am a test description of test listing 1")
  end

end