def test_sign_up(email: 'example@example.com', password: 'password', password_confirm: 'password')
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirm
  click_button 'Sign up'
end

def test_sign_out
  click_link 'Sign out'
end

def create_restaurant
  visit '/restaurants'
  click_button 'Add a Restaurant'
  fill_in 'Name', with: 'KFC'
  fill_in 'Description', with: 'Chicken'
  click_button 'Create Restaurant'
end
