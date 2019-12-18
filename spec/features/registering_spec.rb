feature 'registering as a user' do
  scenario 'registering and seeing user name' do
    register('test_user_1', 'test_1_email@test.com', 'testPassword')

    expect(current_path).to eq('/listings')
    expect(page).to have_content('Welcome test_user_1')
  end
end
