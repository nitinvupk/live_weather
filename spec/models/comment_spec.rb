require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    city = FactoryBot.create(:city)
    user = FactoryBot.create(:user)
    subject { described_class.new(body: 'good', city_id: city.id, user_id: user.id) }

    it 'is valid with valid attributes' do
     expect(subject).to be_valid
    end

    it 'is not valid without a name' do
     subject.body = nil
     expect(subject).not_to be_valid
    end

    it 'is valid with valid attributes' do
      subject.user = nil
      expect(subject).not_to be_valid
    end

    it 'is valid with valid attributes' do
      subject.city = nil
      expect(subject).not_to be_valid
    end
  end
end
