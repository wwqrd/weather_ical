require "rails_helper"

describe WeatherService, :vcr => true do

  let(:location) { "London" }
  let(:weather_service) { WeatherService.new(location) }

  it 'can be initialized' do
    weather_service
  end

  describe '#hour_by_hour' do
    subject(:hour_by_hour) { weather_service.hour_by_hour }

    it 'returns an array of Forecast' do
      expect(hour_by_hour).to be_an(Array)
      hour_by_hour.each do |forecast|
        expect(forecast).to be_a(Forecast)
      end
    end
  end

end
