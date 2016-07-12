describe 'restaurants/index.html.erb' do
  context 'when restaurants exist' do
    it 'displays the restaurant' do
      assign(:restaurants, [Restaurant.create(name: 'KFC')])

      render

      expect(rendered).to have_content 'KFC'
      expect(rendered).not_to have_content 'No restaurants yet'
    end
  end

  context 'when no restaurants exist' do
    it "displays 'No restaurants yet'" do
      assign(:restaurants, [])

      render

      expect(rendered).to have_content 'No restaurants yet'
    end
  end
end
