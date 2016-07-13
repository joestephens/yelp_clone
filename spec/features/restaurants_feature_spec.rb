require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      test_sign_up
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end

    scenario 'doesn\'t have \'Add a restaurant\' link if not logged in' do
      visit '/restaurants'
      expect(page).not_to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    before do
      test_sign_up
      create_restaurant
    end

    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content('KFC')
      expect(page).not_to have_content('No restaurants yet')
    end
  end

  context 'creating restaurants' do
    scenario 'prompts user to fill out a form, then displays the new restaurant' do
      test_sign_up
      create_restaurant
      expect(page).to have_content 'KFC'
      expect(current_path).to eq '/restaurants'
    end

    context 'an invalid restaurant' do
      it 'does not let you submit a name that is too short' do
        test_sign_up
        visit '/restaurants'
        click_link 'Add a restaurant'
        fill_in 'Name', with: 'kf'
        click_button 'Create Restaurant'
        expect(page).not_to have_css 'h2', text: 'kf'
        expect(page).to have_content 'error'
      end
    end

    scenario 'user not logged in' do
      visit '/restaurants/new'
      expect(current_path).to eq '/users/sign_in'
    end
  end

  context 'viewing restaurants' do
    before do
      test_sign_up
      create_restaurant
    end

    scenario 'lets users view a restaurant' do
      visit '/restaurants'
      click_link 'KFC'
      expect(page).to have_content 'KFC'
    end
  end

  context 'editing restaurants' do
    before do
      test_sign_up
      create_restaurant
    end

    scenario 'let a user edit a restaurant' do
      visit '/restaurants'
      click_link 'Edit KFC'
      fill_in 'Name', with: 'Kentucky Fried Chicken'
      fill_in 'Description', with: 'Deep fried chicken'
      click_button 'Update Restaurant'
      expect(page).to have_content 'Kentucky Fried Chicken'
      expect(page).to have_content 'Deep fried chicken'
      expect(current_path).to eq '/restaurants'
    end

  end

  context 'deleting restaurants' do
    before do
      test_sign_up
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KFC'
      fill_in 'Description', with: 'Deep fried goodness'
      click_button 'Create Restaurant'
    end

    scenario 'removes a restaurant when a user clicks a delete link' do
      visit '/restaurants'
      click_link 'Delete KFC'
      expect(page).not_to have_content 'KFC'
      expect(page).to have_content 'Restaurant deleted successfully'
    end
  end

  context 'user didn\'t create restaurant' do
    scenario 'user can\'t edit or delete restaurant' do
      test_sign_up
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KFC'
      fill_in 'Description', with: 'Deep fried goodness'
      click_button 'Create Restaurant'
      test_sign_out
      test_sign_up(email: 'doge@doge.com')
      expect(page).not_to have_link 'Edit KFC'
      expect(page).not_to have_link 'Delete KFC'
    end
  end
end
