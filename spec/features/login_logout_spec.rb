feature 'login logout' do
  scenario 'user logs out and then log in' do
    # registering a user
    visit '/users/new'
    fill_in 'name', with: 'test_user_1'
    fill_in 'email', with: 'test_1_email@test.com'
    fill_in 'password',with: 'testPassword'
    click_button 'submit' 

    click_on 'Log out'
    expect(current_path).to eq '/listings'
    expect(page).not_to have_content('Welcome test_user_1')

    visit '/login'
    fill_in 'user_email', with: 'test_1_email@test.com'
    fill_in 'password', with: 'testPassword'
    click_button 'Log in'

    expect(current_path).to eq '/listings'
    expect(page).to have_content('Welcome test_user_1')
  end
end
