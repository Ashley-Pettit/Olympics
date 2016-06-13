class Event < ActiveRecord::Base
    has_many :countries, through: :participants
    validates :sport_title, presence: true
    validates :countryA, presence: true, length: { maximum: 100 }
    validates :countryB, presence: true, length: { maximum: 100 }
    validates :start_time, presence: true
    validates :finish_time, presence: true
    # Note for simplicity an event presently only has two countrys playing againist each other. In real life in some sports there are many countries all competiting at the same time. To fully build a solution it may be necessary to create a model for every sport however, for the purpose of this excercise only countryVcountry sports are considered.

    # Making a link via participants is an example of how a many to many relationship could handle the above problem.

    def draw?
      self.countryAScore == self.countryBScore
    end

    def is_event_presently_running?
      Time.now.between?(self.start_time, self.finish_time)
    end

    def is_event_in_past?
      Time.now >= self.finish_time
    end

    def is_event_in_future?
      Time.now <= self.start_time
    end

end
