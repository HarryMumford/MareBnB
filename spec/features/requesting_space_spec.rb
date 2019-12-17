feature 'Requesting to hire a space' do
  scenario 'user can request a listing to stay at' do
    register('Landlord', 'landlord@email.com', 'password123')
    expect(current_path).to eq '/listings'
    list_a_space('Test Listing 1', 'i am a test description of test listing 1', 900)
    click_on 'Log out'

    register('Lodger', 'lodger@email.com', 'password456')

    expect(current_path).to eq '/listings'
    click_button 'request_listing'

    expect(page).to have_content('Test Listing 1')
    expect(page).to have_content('i am a test description of test listing 1')
    expect(page).to have_content('landlord@email.com')
  end
end
