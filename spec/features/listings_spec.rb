feature 'create and view listings' do

  scenario 'user redirects to listings/new' do
    visit '/listings'
    click_button 'add_new_listing'

    expect(current_path).to eq('/listings/new')
  end

  scenario 'user can create and view their listing and show the available dates to rent out' do
    register('name', 'email', 'password')

    visit '/listings/new'
    fill_in 'listing_name', with: 'Test Listing 1'
    fill_in 'listing_description', with: 'I am a test description of test listing 1'
    fill_in 'start_date', with: '01/01/2020'
    fill_in 'end_date', with: '07/01/2020'
    fill_in 'listing_price', with: 1000
    
    click_button 'post_listing'

    expect(current_path).to eq('/listings')
    expect(page).to have_content("Test Listing 1")
    expect(page).to have_content("I am a test description of test listing 1")
    expect(page).to have_content(1000)
    
    click_on 'request_listing'
   
    expect(page).to have_content("2020-01-01")
    expect(page).to have_content("2020-01-07")
  end

end
