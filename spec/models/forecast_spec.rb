require "rails_helper"

RSpec.describe Forecast, :type => :model do

  it "has a valid factory" do
    expect(FactoryGirl.build(:forecast)).to be_valid
  end

  it "is not valid when time_to is before time_from" do
    time_to = DateTime.current - 1.hour
    forecast = FactoryGirl.build(:forecast, time_to: time_to)
    expect(forecast).to_not be_valid
  end

  it "is not valid with a non-numerical precipitation" do
    expect(FactoryGirl.build(:forecast, precipitation: "rain")).to_not be_valid
  end

  it "is not valid with a negative precipitation" do
    expect(FactoryGirl.build(:forecast, precipitation: -1.0)).to_not be_valid
  end

  it "is not valid with a non-numerical wind speed" do
    expect(FactoryGirl.build(:forecast, wind_speed: "fast")).to_not be_valid
  end

  it "is not valid with a negative wind speed" do
    expect(FactoryGirl.build(:forecast, wind_speed: -1)).to_not be_valid
  end

  it "is not valid with a non-numerical temperature" do
    expect(FactoryGirl.build(:forecast, temperature: "hot")).to_not be_valid
  end

  it "is not valid with a non-numerical pressure" do
    expect(FactoryGirl.build(:forecast, pressure: "light")).to_not be_valid
  end

  it "is not valid with a negative pressre" do
    expect(FactoryGirl.build(:forecast, pressure: -1)).to_not be_valid
  end

  it "is valid only with #{Forecast::WIND_DIRECTIONS} as wind directions" do
    expect(FactoryGirl.build(:forecast, wind_direction: "Due north")).to_not be_valid
  end

end
