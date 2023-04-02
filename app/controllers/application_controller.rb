# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
