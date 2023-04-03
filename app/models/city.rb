# frozen_string_literal: true

require 'net/http'
require 'json'

# app/models/city.rb
class City < ApplicationRecord
  before_save   :downcase_name
  before_create :add_timezone
  validates :name, presence: true, uniqueness: { case_sensitive: false },
                   length: { maximum: 50 }

  has_many :comments, dependent: :destroy

  class << self
    # Retrieves the weather json
    def get_weather(name, type = 'weather')
      api_key = 'affd39b1038eeab8063b783a52f87dad'

      # TODO: Change units based on locale
      uri = URI("http://api.openweathermap.org/data/2.5/#{type}?q=#{CGI.escape(name)}&units=imperial&appid=#{api_key}")

      res = JSON.parse(Net::HTTP.get(uri))
    end
  end

  private

  # Converts city name to all lower-case.
  def downcase_name
    name.downcase!
  end

  # Lookup the correct timezone based on the latitude and longitude.
  def add_timezone
    res = City.get_weather(name)

    begin
      self.timezone = Timezone.lookup(res['coord']['lat'], res['coord']['lon']).name
    rescue Timezone::Error::Base => e
      puts "Timezone Error: #{e.message}"
    end
  end
end
