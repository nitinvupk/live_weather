require 'rails_helper'

RSpec.describe City, type: :model do
 describe 'validations' do
  subject { described_class.new(name: 'New York', timezone: 'America/New_York') }

  it 'is valid with valid attributes' do
   expect(subject).to be_valid
  end

  it 'is not valid without a name' do
   subject.name = nil
   expect(subject).not_to be_valid
  end

  it 'is not valid with a blank name' do
   subject.name = ''
   expect(subject).not_to be_valid
  end

  it 'is not valid with a name longer than 50 characters' do
   subject.name = 'a' * 51
   expect(subject).not_to be_valid
  end
 end
end
