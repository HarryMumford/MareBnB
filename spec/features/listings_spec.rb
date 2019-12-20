feature 'create and view listings' do

  before(:each) { Capybara.current_driver = Capybara.javascript_driver }

  scenario 'user redirects to listings/new' do
    register('name', 'email', 'password')
    click_button 'add_new_listing'

    expect(current_path).to eq('/listings/new')
  end

  scenario 'user can create and view their listing and show the available dates to rent out' do
    register('name', 'email', 'password')

    list_a_space("Test Listing 1", "I am a test description of test listing 1", 1000, Time.new(2020, 01, 01), Time.new(2020, 01, 07))

    expect(current_path).to eq('/listings')
    expect(page).to have_content("Test Listing 1")
    expect(page).to have_content("I am a test description of test listing 1")
    expect(page).to have_content(1000)

    click_on 'request_listing'

    expect(page).to have_content("Availability")
    expect(page).to have_content("2020-01-01")
    expect(page).to have_content("2020-01-07")
  end

  scenario 'user can add multiple availible dates' do
    register('name', 'email', 'password')

    click_on 'add_new_listing'

    fill_in 'listing_name', with: "An Alley"
    fill_in 'listing_description', with: "A lovely place to stay"
    fill_in 'listing_price', with: 700
    fill_in 'start_date0', with: Time.new(2020, 01, 01)
    fill_in 'end_date0', with: Time.new(2020, 01, 31)
    click_button 'add_availability'
    fill_in 'start_date1', with: Time.new(2020, 03, 01)
    fill_in 'end_date1', with: Time.new(2020,03,15)

    click_button 'post_listing'

    click_on 'request_listing'

    expect(page).to have_content("2020-01-01")
    expect(page).to have_content("2020-01-31")
    expect(page).to have_content("2020-03-01")
    expect(page).to have_content("2020-03-15")

  end
end
