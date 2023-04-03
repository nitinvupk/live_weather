require 'factory_bot'
FactoryBot.define do
  factory :city, class: 'City' do
   name { 'London' }
  end
end