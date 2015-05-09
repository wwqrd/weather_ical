class Event

  include ActiveModel::Model

  attr_accessor :time_from, :time_to, :label, :description

  validates_datetime :time_from, :time_to
  validates_datetime :time_to, :after => :time_from

end
