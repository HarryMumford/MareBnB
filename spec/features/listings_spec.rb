feature 'create and view listings' do

  scenario 'user redirects to listings/new' do
    register('name', 'email', 'password')
    click_button 'add_new_listing'

    expect(current_path).to eq('/listings/new')
  end

  scenario 'user can create and view their listing and show the available dates to rent out' do
    register('name', 'email', 'password')

    list_a_space("Test Listing 1", "I am a test description of test listing 1", 1000, "01/01/2020", "07/01/2020")

    expect(current_path).to eq('/listings')
    expect(page).to have_content("Test Listing 1")
    expect(page).to have_content("I am a test description of test listing 1")
    expect(page).to have_content(1000)

    click_on 'request_listing'

    expect(page).to have_content("Availability")
    expect(page).to have_content("2020-01-01")
    expect(page).to have_content("2020-01-07")
  end

end
