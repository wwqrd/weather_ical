class WeatherService
  include HTTParty
  base_uri 'www.yr.no'

  attr_accessor :location

  def initialize(location)
    @location = location
  end

  def hour_by_hour
    response = self.class.get("/place/United_Kingdom/England/#{location}/forecast_hour_by_hour.xml")
    tabular = response.parsed_response["weatherdata"]["forecast"]["tabular"]["time"]
    tabular.map do |time|
      Forecast.new(
        time_from: DateTime.parse(time['from']),
        time_to: DateTime.parse(time['to']),
        summary: time['symbol']['name'],
        precipitation: time['precipitation']['value'].to_f,
        wind_direction: time['windDirection']['code'].to_sym,
        wind_speed: time['windSpeed']['mps'].to_f,
        temperature: time['temperature']['value'].to_f,
        pressure: time['pressure']['value'].to_f
      )
    end
  end

end
