class SubwayStop < ActiveRecord::Base
  belongs_to :borough
  has_many :boroughs, through: :subway_stops
end
