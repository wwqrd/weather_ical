class ForecastController < ApplicationController
  before_action :set_forecast_series, only: [:show]

  def show
    rain_calendar = ForecastCalendar.Rain(@forecast_series)

    respond_to do |format|
      format.json { render :json => rain_calendar.combined_series }
      format.ics { render :text => rain_calendar.to_ics, content_type: 'text/calendar; charset=utf-8' }
    end
  end

  private

    def set_forecast_series
      @forecast_series = WeatherService.new(params[:location]).hour_by_hour
    end

end
