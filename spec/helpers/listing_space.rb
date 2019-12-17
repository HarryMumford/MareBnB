def list_a_space
  visit '/listings/new'
  fill_in 'listing_name', with: 'Test Listing 1'
  fill_in 'listing_description', with: 'i am a test description of test listing 1'
  click_button 'post_listing'
end
