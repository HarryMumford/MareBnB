def register(name, email, password)
  visit '/users/new'
  fill_in 'name', with: name
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'submit'
end

def log_in(email, password)
  visit '/login'
  fill_in 'user_email', with: email
  fill_in 'password', with: password
  click_button 'Log in'
end
