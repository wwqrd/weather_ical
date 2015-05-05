class ForecastController < ApplicationController

  def show
    calendar = rain_calendar

    respond_to do |format|
      format.json { render :json => calendar.combined_series }
      format.ics { render :text => calendar.to_ics, content_type: 'text/calendar; charset=utf-8' }
    end
  end

  private

    def location
      params[:location]
    end

    def forecast_series
      @forecast_series ||= WeatherService.new(location).hour_by_hour
    end

    def rain_calendar
      ForecastCalendar.Generate(forecast_series, 'Rain') do |forecast|
        forecast.precipitation > 0.0
      end
    end

end
