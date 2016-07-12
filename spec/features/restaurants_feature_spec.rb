require 'rails_helper'

feature 'restaurants' do

  context 'No restaurants have been added' do
    scenario 'Should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_content 'Add a restaurant'
    end
  end

  context 'Users can add a restaurant ' do
    scenario 'User clicks link to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      click_link('Add a restaurant')
      expect(page.current_path).to eq "/restaurants/new"
      expect(page).to have_content "Add a new restaurant"
    end
    scenario 'User fills in form and sumbits' do
      visit '/restaurants/new'
      fill_in('Name', :with => 'American Diner')
      fill_in('Description', :with => 'Great cheese burgers')
      click_button('Create Restaurant')
    end
  end

  context 'Users can view page of restaurant' do
    let!(:kfc) { Restaurant.create(name: 'KFC', description: 'chicken') }

    scenario 'User clicks restaurant link on index' do
      visit '/restaurants'
      click_link 'KFC'
      expect(page).to have_content 'KFC'
      expect(page).to have_content 'chicken'
      expect(current_path).to eq "/restaurants/#{kfc.id}"
    end
  end

  context 'Users can edit a restaurant' do
    let!(:kfc) { Restaurant.create(name: 'KFC', description: 'chicken') }

    scenario 'User clicks edit' do
      visit "/restaurants/#{kfc.id}"
      click_link 'Edit Restaurant'
      expect(current_path).to eq "/restaurants/#{kfc.id}/edit"
    end

    scenario 'User edits restaurant' do
      visit "/restaurants/#{kfc.id}/edit"
      fill_in('Name', :with => 'American Diner')
      fill_in('Description', :with => 'Great cheese burgers')
      click_button('Update Restaurant')
      expect(current_path).to eq "/restaurants/#{kfc.id}"
    end
  end

  context 'User can delete a restaurant' do
    let!(:kfc) { Restaurant.create(name: 'KFC', description: 'chicken') }

    scenario 'User clicks delete' do
      visit "/restaurants/#{kfc.id}"
      click_link 'Delete Restaurant'
      expect(current_path).to eq "/restaurants"
    end
  end
end
