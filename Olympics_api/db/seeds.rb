require 'faker'
require 'as-duration'

#Creating 500 dummy events
#For testing purposes only all events finish 2 hours after they start

500.times do
  starting_time = Faker::Time.between(Time.now - 2.days, Time.now + 2.days, :day)
  Event.create!(
  sport_title: Faker::Team.sport.capitalize,
  countryA: Faker::Address.country,
  countryB: Faker::Address.country,
  start_time: starting_time,
  finish_time: starting_time + 2.hours,
  countryA_score: Faker::Number.number(2),
  countryB_score: Faker::Number.number(2) )
end
