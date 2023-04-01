class CitiesController < ApplicationController
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @result = @city.save
        format.html { redirect_to city_url(@city), notice: "City was successfully created." }
        format.json { render :show, status: :created, location: @city }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @city = City.find(params[:id])

    respond_to do |format|
      if @result = @city.destroy
        format.html { redirect_to root_url }
        format.json { head :no_content }
        format.js
      else
        format.html {
          @city.errors.full_messages.each do |msg|
            flash[:danger] = msg
          end
          redirect_to root_url
        }
        format.js
      end
    end
  end

  private

    def city_params
      params.require(:city).permit(:name, :timezone)
    end
end
