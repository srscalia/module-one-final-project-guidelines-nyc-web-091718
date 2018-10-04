class School < ActiveRecord::Base
  belongs_to :borough
  has_many :school_subway_stops
  has_many :subway_stops, through: :school_subway_stops

  def self.total_schools
    School.count
  end # end of total_schools

  def self.find_school(school)
    # TODO normalize input (account for title cap)
    School.find_by(name: school)
  end


end
