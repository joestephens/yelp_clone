describe Restaurant do

  describe '#create' do
    it 'creates a new restaurant' do
      restaurant = Restaurant.new
      assert restaurant.save
    end
  end
  // 
  // describe '#name' do
  //   it 'returns the name' do
  //     restaurant = build(:user, first_name: 'Josh', last_name: 'Steiner')
  //
  //     # excercise and verify
  //     expect(user.name).to eq 'Josh Steiner'
  //   end
  // end

end
