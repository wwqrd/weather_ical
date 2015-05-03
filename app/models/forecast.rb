class Forecast
  include ActiveModel::Model
  WIND_DIRECTIONS = [:N, :NNE, :NE, :NEE, :E, :SEE, :SE, :SSE, :S,
                     :SSW, :SW, :SSW, :W, :NWW, :NW, :NNW]

  attr_accessor :time_from, :time_to, :summary, :precipitation,
                :wind_direction, :wind_speed, :temperature, :pressure

  validates_datetime :time_from, :time_to
  validates_datetime :time_to, :after => :time_from
  validates :precipitation, numericality: { greater_than_or_equal_to: 0 }
  validates :wind_speed, numericality: { greater_than_or_equal_to: 0 }
  validates :temperature, numericality: true
  validates :pressure, numericality: { greater_than_or_equal_to: 0 }
  validates :wind_direction, inclusion: { in: WIND_DIRECTIONS,
                                          message: "%{value} is not a valid wind direction" }

end
