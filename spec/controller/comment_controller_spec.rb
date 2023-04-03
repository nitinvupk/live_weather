require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  describe '#create' do
    it 'create a comment for city' do
      city = FactoryBot.create(:city)
      params = { body: 'my first comment' }
      post :create, params: { comment: params,user_id: @user.id, city_id: city.id}
      expect(response).to have_http_status(302)
    end
   end
end
