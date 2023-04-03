require 'rails_helper'

RSpec.describe CitiesController, type: :controller do

  before(:each) do
    user =  FactoryBot.create(:user)
    sign_in user
  end

  describe '#create' do
    user =  FactoryBot.create(:user)
    it 'create a city' do
      params = { name: 'New York',timezone: 'America/New_York'}
      post :create, params: { city: params}, format: :js
      expect(response).to have_http_status(200)
    end
   end

   describe '#destroy' do
   it 'delete a city' do
    city = FactoryBot.create(:city)
     delete :destroy, params: { id: city.id}, format: :js
     expect(response).to have_http_status(200)
   end
  end
end
