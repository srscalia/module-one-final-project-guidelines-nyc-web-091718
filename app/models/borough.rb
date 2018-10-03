class Borough < ActiveRecord::Base
  belongs_to :mayor
  has_many :subway_stops
  has_many :schools
end
