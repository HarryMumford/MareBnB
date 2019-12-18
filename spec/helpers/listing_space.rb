def list_a_space(name, description, price)
  visit '/listings/new'
  fill_in 'listing_name', with: name
  fill_in 'listing_description', with: description
  fill_in 'listing_price', with: price
  click_button 'post_listing'
end
