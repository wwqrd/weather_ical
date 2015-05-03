FactoryGirl.define do
  factory :forecast do
    time_from DateTime.current
    time_to DateTime.current + 1.hour
    summary "Great"
    precipitation 1
    wind_direction :SSW
    wind_speed 2
    temperature 3
    pressure 4
  end
end
