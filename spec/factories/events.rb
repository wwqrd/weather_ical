FactoryGirl.define do
  factory :event do
    time_from DateTime.current
    time_to DateTime.current + 1.hour
    label "Great"
    description "More detailed information about conditions"
  end
end
