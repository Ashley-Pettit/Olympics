ActiveRecord::Schema.define(version: 20160606060736) do

  create_table "events", force: :cascade do |t|
    t.string "sport_title"
    t.string "countryA"
    t.string "countryB"
    t.time   "start_time"
    t.time   "finish_time"
    t.string "countryA_score"
    t.string "countryB_score"
  end

end
