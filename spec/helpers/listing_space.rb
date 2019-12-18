def list_a_space(name, description, price, start_date, end_date)
  visit '/listings/new'
  fill_in 'listing_name', with: name
  fill_in 'listing_description', with: description
  fill_in 'listing_price', with: price
  fill_in 'start_date', with: start_date
  fill_in 'end_date', with: end_date
  click_button 'post_listing'
end
