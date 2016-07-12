require 'rails_helper'

feature 'restaurants' do

  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_content 'Add a restaurant'
    end
  end

  context 'Users can add a restaurant ' do
    scenario 'User clicks link to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      click_link('Add a restaurant');
      expect(page.current_path).to eq "/restaurants/new"
      expect(page).to have_content "Add a new restaurant"
    end
    scenario 'user fills in form and sumbits' do
      visit '/restaurants/new'
      fill_in('Name', :with => 'American Diner')
      fill_in('Description', :with => 'Great cheese burgers')
      click_button('Create Restaurant')
    end
  end
end
