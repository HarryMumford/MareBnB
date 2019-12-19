def approval_setup
  register('Landlord', 'landlord@email.com', 'password123')
  list_a_space("Test Listing 1", "I am a test description of test listing 1", 1000, Time.new(2020, 01, 01), Time.new(2020, 01, 15))
  click_on 'Log out'
  register('Lodger', 'lodger@email.com', 'password456')
  click_button 'request_listing'
  fill_in 'start_date', with: Time.new(2020, 01, 04)
  fill_in 'end_date', with: Time.new(2020, 01, 11)
  click_button 'confirm_request'
  click_on 'Log out'
end
