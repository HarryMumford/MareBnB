feature 'Requests' do
  scenario 'Lodger can see requests they have made' do
    register('Landlord', 'landlord@email.com', 'password123')
    list_a_space("Test Listing 1", "I am a test description of test listing 1", 1000, "01/01/2020", "07/01/2020")
    click_on 'Log out'
    register('Lodger', 'lodger@email.com', 'password456')
    click_button 'request_listing'
    click_button 'confirm_request'

    expect(current_path).to eq '/listings'

    click_link 'user_requests'

    expect(page).to have_content("Test Listing 1")
    expect(page).to have_content("I am a test description of test listing 1")
    expect(page).to have_content(1000)
    expect(page).to have_content("pending")
  end
end
