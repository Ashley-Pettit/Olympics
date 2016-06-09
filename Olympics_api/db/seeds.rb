require 'faker'
require 'as-duration'

#Creating 1000 dummy events
1000.times do
  starting_time = Faker::Time.between(Time.now - 2.days, Time.now + 2.days, :day)
  Event.create!(
  sport_title: Faker::Team.sport,
  countryA: Faker::Address.country,
  countryB: Faker::Address.country,
  start_time: starting_time,
  #For dummy purposes all events finish 2 hours after they start
  finish_time: starting_time + 2.hours,
  countryA_score: Faker::Number.number(2),
  countryB_score: Faker::Number.number(2) )
end
