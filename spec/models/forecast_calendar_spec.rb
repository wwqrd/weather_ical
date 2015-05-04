require "rails_helper"

describe ForecastCalendar, :vcr => true do

  let(:location) { "London" }
  let(:weather_service) { WeatherService.new(location) }
  let(:forecast_series) { weather_service.hour_by_hour }

  describe '#ics' do
    let(:rain_calendar) { ForecastCalendar.Rain(forecast_series) }
    subject(:ics) { rain_calendar.to_ics }

    it 'returns the forecast in .ics format' do
      ics_lines = ics.split("\n")
      expect(ics_lines.first).to eq("BEGIN:VCALENDAR")
      expect(ics_lines.last).to eq("END:VCALENDAR")
    end

  end

  describe '.Rain' do

    subject(:rain_calendar) { ForecastCalendar.Rain(forecast_series) }

    it 'creates a ForecastCalendar' do
      expect(rain_calendar).to be_a(ForecastCalendar)
    end

  end

end
