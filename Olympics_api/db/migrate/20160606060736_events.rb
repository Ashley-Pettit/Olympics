class Events < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :sport_title
      t.string :countryA
      t.string :countryB
      t.time :start_time
      t.time :finish_time
      t.string :countryA_score
      t.string :countryB_score
    end
  end

end
