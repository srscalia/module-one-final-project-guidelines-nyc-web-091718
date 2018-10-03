class School < ActiveRecord::Base
  belongs_to :borough
  has_many :school_subway_stops
  has_many :subway_stops, through: :school_subway_stops
end
