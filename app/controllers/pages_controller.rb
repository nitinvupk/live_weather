# frozen_string_literal: true

# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  def home
    @city = City.new
    @cities = City.all
  end

  def help; end
end
