require 'ri_cal'

class ForecastCalendar

  def initialize(forecast_series, condition)
    @condition = condition
    @forecast_series = forecast_series
  end

  def combined_series
    (first, *rest) = @forecast_series
    [first].tap do |combined_series|
      rest.each do |forecast|
        if forecast.time_from == combined_series.last.time_to
          # We are trashing the data here, e.g. each forecast will
          # probably contain different values for precipitation; this
          # implementation only cares about the first in each run.
          combined_series.last.time_to = forecast.time_to
        else
          combined_series << forecast
        end
      end
    end
  end

  def to_ics
    # This needs some thought
    calendar = RiCal.Calendar do |cal|
      cal.add_x_property 'x_wr_calname', "#{@condition}"
      debugger
      combined_series.each do |forecast|
        cal.event do |event|
          event.summary = @condition
          event.description = @condition  # Maybe this could hold detailed data
          event.dtstart =  forecast.time_from
          event.dtend = forecast.time_to
        end
      end
    end

    calendar.to_s
  end

  def self.Generate(forecast_series, description, &filter)
    precipitation_series = forecast_series.select(&filter)

    ForecastCalendar.new(precipitation_series, description)
  end

end
