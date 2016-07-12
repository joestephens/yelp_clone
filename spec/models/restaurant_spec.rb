describe Restaurant do

  describe '#create' do
    it 'creates a new restaurant' do
      restaurant = Restaurant.new
      assert restaurant.save
    end
  end

  describe '#name' do
    it 'returns the name' do
      restaurant = Restaurant.create(name: 'KFC')
      expect(restaurant.name).to eq 'KFC'
    end
  end

  describe '#description' do
    it 'returns the description' do
      restaurant = Restaurant.create(description: 'chicken')
      expect(restaurant.description).to eq 'chicken'
    end
  end

end
