feature 'registering as a user' do
  scenario 'registering and seeing user name' do
    visit '/users/new'
    fill_in 'name', with: 'test_user_1'
    fill_in 'email', with: 'test_1_email@test.com'
    fill_in 'password', with: 'testPassword'
    click_button 'submit' 

    expect(current_path).to eq('/listings')
    expect(page).to have_content('Welcome test_user_1')
  end
end
