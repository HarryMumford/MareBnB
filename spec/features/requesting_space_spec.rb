feature 'Requesting to hire a space' do
  scenario 'user can request a listing to stay at' do
    sign_up_and_login
    expect(current_path).to eq '/listings'
    list_a_space
    click_on 'sign_out'

    visit '/'
    fill_in 'email', with: 'lodger@email.com'
    fill_in 'password', with: 'password123'
    fill_in 'password', with: 'password123'
    click_button 'sign_up'

    expect(current_path).to eq '/listings'
    click_button 'request_listing'
  end
end
