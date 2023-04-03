# frozen_string_literal: true

# app/controllers/cities_controller.rb
class CitiesController < ApplicationController
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if (@result = @city.save)
        format.html { redirect_to city_path(@city) }
        format.json { render :show, status: :created, location: root_url }
      else
        format.html { redirect_to root_path, status: :see_other }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  def show
    @city = City.find(params[:id])
  end

  def destroy
    @city = City.find(params[:id])

    respond_to do |format|
      if (@result = @city.destroy)
        format.html { redirect_to root_url }
        format.json { head :no_content }
      else
        format.html do
          @city.errors.full_messages.each do |msg|
            flash[:danger] = msg
          end
          redirect_to root_url
        end
      end
      format.js
    end
  end

  private

  def city_params
    params.require(:city).permit(:name)
  end
end
