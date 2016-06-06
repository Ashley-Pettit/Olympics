class Events < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :sport_title
      t.string :countryA
      t.string :countryB
      t.time :time
      t.date :date
      t.string :score
    end
  end

end
