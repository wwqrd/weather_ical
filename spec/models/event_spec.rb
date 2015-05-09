require "rails_helper"

describe Event, :type => :model do

  it "has a valid factory" do
    expect(FactoryGirl.build(:event)).to be_valid
  end

  it "is not valid when time_to is before time_from" do
    time_to = DateTime.current - 1.hour
    forecast = FactoryGirl.build(:forecast, time_to: time_to)
    expect(forecast).to_not be_valid
  end

end
