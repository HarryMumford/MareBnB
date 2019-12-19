feature 'login logout' do
  scenario 'user logs out and then log in' do
    # registering a user
    register('test_user_1', 'test_1_email@test.com', 'testPassword')

    click_on 'Log out'
    expect(current_path).to eq '/'
    expect(page).not_to have_content('Welcome test_user_1')

    log_in('test_1_email@test.com', 'testPassword')

    expect(current_path).to eq '/listings'
    expect(page).to have_content('Welcome test_user_1')
  end

  scenario 'user tries to log in with wrong password' do
    register('test_user_1', 'test_1_email@test.com', 'testPassword')

    click_on 'Log out'

    log_in('test_1_email@test.com', 'wrongTestPassword')
    
    expect(current_path).to eq('/login')
    expect(page).to have_content('Incorrect details')
  end
end
