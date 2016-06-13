class Country < ActiveRecord::Base
  has_many :events, through: :participants
  has_many :participants

end
