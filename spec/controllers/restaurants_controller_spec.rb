
describe RestaurantsController, type: :controller do
  describe 'POST #create' do

    context 'when form is submitted' do
      it 'redirects to /restaurants' do
        # restaurant = Restaurant.new
        post :create, params: {'restaurant' => {"name"=>"joe", "description"=>"pizza"}}
        expect(response).to redirect_to('/restaurants')
      end
    end

    # context 'when password is valid' do
    #   it 'sets the user in the session and redirects them to their dashboard' do
    #     user = create(:user)
    #
    #     post :create, session: { email: user.email, password: user.password }
    #
    #     expect(response).to redirect_to '/dashboard'
    #     expect(controller.current_user).to eq user
    #   end
    # end
  end

end
