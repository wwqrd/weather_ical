require "rails_helper"

describe ForecastCalendar, :vcr => true do

  let(:event_name) { 'Rain' }
  let(:location) { "London" }
  let(:weather_service) { WeatherService.new(location) }
  let(:forecast_series) { weather_service.hour_by_hour }
  let(:rain_filter) { proc { |forecast| forecast.precipitation > 0.0 } }
  let(:rain_calendar) do
    ForecastCalendar.Generate(forecast_series, event_name, &rain_filter)
  end

  describe '#ics' do
    subject(:ics) { rain_calendar.to_ics }

    it 'returns the forecast in .ics format' do
      ics_lines = ics.split("\n")
      expect(ics_lines.first).to eq("BEGIN:VCALENDAR")
      expect(ics_lines.last).to eq("END:VCALENDAR")
    end

  end

  describe '.Generate' do
    it 'creates a ForecastCalendar' do
      expect(rain_calendar).to be_a(ForecastCalendar)
    end

  end

end
