class ForecastController < ApplicationController
  before_action :set_forecast, only: [:show]

  def show
    respond_to do |format|
      format.html
      format.ics
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forecast
      @forecast = WeatherService.new(params[:location]).hour_by_hour
    end

end
