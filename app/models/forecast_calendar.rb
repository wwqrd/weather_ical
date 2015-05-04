require 'ri_cal'

class ForecastCalendar

  def initialize(forecast_series, condition)
    @condition = condition
    @forecast_series = forecast_series
  end

  def to_ics
    # This needs some thought
    calendar = RiCal.Calendar do |cal|
      @forecast_series.each do |forecast|
        cal.event do |event|
          event.summary = @condition
          event.description = @condition
          event.dtstart =  forecast.time_from
          event.dtend = forecast.time_to
        end
      end
    end

    calendar.to_s
  end

  def self.Rain(forecast_series)
    forecast_series.select! { |forecast| forecast.precipitation > 0.0 }

    rain_series = []
    forecast_series.each do |forecast|
      if rain_series.size > 0 && forecast.time_from == rain_series.last.time_to
        rain_series.last.time_to = forecast.time_to
      else
        rain_series << forecast
      end
    end

    ForecastCalendar.new(rain_series, 'Rain')
  end

end
