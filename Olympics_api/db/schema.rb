ActiveRecord::Schema.define(version: 20160606060736) do

  create_table "events", force: :cascade do |t|
    t.string "sport_title"
    t.string "countryA"
    t.string "countryB"
    t.time   "time"
    t.date   "date"
    t.string "score"
  end

end
