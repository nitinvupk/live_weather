require 'rails_helper'

# RSpec.describe City, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

# require 'rails_helper'

RSpec.describe City, type: :model do
  context "validation tests" do
    it 'ensures presence of name' do
      city = City.new().save
      expect(city).to eq(false)
    end

    it 'should save successfully' do
      city = City.new(name: 'New York', timezone: 'America/New_York').save
      expect(city).to eq(true)
    end
  end
end