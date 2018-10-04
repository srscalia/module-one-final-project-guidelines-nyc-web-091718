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
  end # end of find schools

  def self.average_graduation_rate
    total = School.sum(:graduation_rate)
    count = School.count
    average = (total/count).round(3)
  end # end of graduation rate


  ### Instance Methods on a School

  def print_school_info
    line_break = "\n\n"
    puts "Here is a bit of info about #{self.name}:#{line_break}"
    puts "\t#{self.overview_paragraph}#{line_break}"
    puts "\tTotal students: #{self.total_students}#{line_break}"
    puts "\tGraduation rate: #{self.graduation_rate}#{line_break}"
  end


end
