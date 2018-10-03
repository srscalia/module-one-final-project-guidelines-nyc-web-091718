class SubwayStop < ActiveRecord::Base
  belongs_to :borough
  has_many :school_subway_stops
  has_many :schools, through: :school_subway_stops
end
