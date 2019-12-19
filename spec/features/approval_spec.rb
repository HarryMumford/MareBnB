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

    expect(page).to have_content("Requests I have made")
    expect(page).to have_content("Test Listing 1")
    expect(page).to have_content("I am a test description of test listing 1")
    expect(page).to have_content(1000)
    expect(page).to have_content("pending")
  end

  scenario 'User can see requests they have received and can approve them' do
    Capybara.current_driver = Capybara.javascript_driver

    register('Landlord', 'landlord@email.com', 'password123')
    list_a_space("Test Listing 1", "I am a test description of test listing 1", 1000, "01/01/2020", "07/01/2020")
    click_on 'Log out'
    register('Lodger', 'lodger@email.com', 'password456')
    click_button 'request_listing'
    fill_in 'start_date', with: "04/01/2020"
    fill_in 'end_date', with: "11/01/2020"
    click_button 'confirm_request'
    click_on 'Log out'
    log_in('landlord@email.com', 'password123')

    click_link 'user_requests'

    expect(page).to have_content("Requests I have received")
    expect(page).to have_content("Name of listing: Test Listing 1")
    expect(page).to have_content("Name of user: Lodger")
    expect(page).to have_content("Email of user: lodger@email.com")
    expect(page).to have_content("Start date: 2020-01-04")
    expect(page).to have_content("End date: 2020-01-11")
    expect(page).to have_content("Accept")
    expect(page).to have_content("Reject")

    click_button 'Accept'

    expect(page).to have_content('Accepted')
    expect(page).not_to have_selector('button', text: "Accept")
    expect(page).not_to have_content("Reject")
  end

end
