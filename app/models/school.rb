class School < ActiveRecord::Base
  belongs_to :borough
  has_many :subway_stops, through: :boroughs
end
