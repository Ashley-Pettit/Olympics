require 'faker'

events_list = [
  {sport_title: "Basketball", countryA: "America", CountryB: "New Zealand", start_time: "2016-05-19 12:45:00 -0700", finish_time: "2016-05-19 14:30:00 -0700", countryA_score: "63", countryB_score: "23"},
  {sport_title: "Tennis", countryA: "Australia", countryB: "Canada", start_time: "2016-05-19 07:45:00 -0700", finish_time: "2016-05-19 09:30:00 -0700", countryA_score: "6", countryB_score: "2"}
]

events_list.each do |sport_title, countryA, countryB, start_time, finish_time, countryA_score, countryB_score |
  #could this be refactored to 'do |args|'' ?
  Event.create( sport_title: sport_title, countryA: countryA, countryB: countryB, start_time: start_time, finish_time: finish_time, countryA_score: countryA_score, countryB_score: countryB_score)
end



# faker_data = [
#   "sport_title" => Faker::Lorem.words(1),
#   "countryA" => Faker::Address.country,
#   "countryB" => Faker::Address.country,
#   "start_time" => Faker::Time.between(2.days.ago, Time.now, :all),
#   "finish_time" => Faker::Time.between(1.days.ago, Time.now, :all),
#   "countryA_score" => Faker::Number.number(2),
#   "countryB_score" => Faker::Number.number(2)
# ]

# t.string :sport_title
# t.string :countryA
# t.string :countryB
# t.time :start_time
# t.time :finish_time
# t.string :countryA_score
# t.string :countryB_score

# Event.create(
#   sport_title: "Basketball",
#   countryA: "America",
#   countryB: "New Zealand",
#   start_time: "2016-05-19 12:45:00 -0700",
#   finish_time: "2016-05-19 14:30:00 -0700",
#   countryA_score: "63",
#   countryB_score: "23")
