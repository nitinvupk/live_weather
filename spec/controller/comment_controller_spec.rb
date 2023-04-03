require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  before(:each) do
    @user = User.create(email: 'john@gmail.com', password: '123456')
    sign_in @user
  end

  describe '#create' do
    it 'create a comment for city' do
      city = City.create!(name: 'Bhopal')
      params = { body: 'my first comment' }
      post :create, params: { comment: params,user_id: @user.id, city_id: city.id}
      expect(response).to have_http_status(302)
    end
   end
end
