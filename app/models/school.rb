class School < ActiveRecord::Base
  belongs_to :borough
  has_many :school_subway_stops
  has_many :subway_stops, through: :school_subway_stops

  def self.total_schools
    School.count
  end # end of total_schools

  def self.find_school(school)
    # school is the user input
    # TODO normalize input (account for title cap)
    school = school
    list_of_names = School.all.map do |instance|
      instance.name
    end
    if list_of_names.include? school
      School.find_by(name: school)
    else
      puts "ERROR!"
    end
  end # end of find schools

  def self.average_graduation_rate
    total = School.sum(:graduation_rate)
    count = School.count
    average = (total/count).round(3)
  end # end of graduation rate


  ### Instance Methods on a School

  def print_school_info
    line_break = "\n\n"
    puts line_break
    puts "_" * 75
    puts "#{line_break}Here is a bit of info about #{self.name}:#{line_break}"
    puts "\t#{self.overview_paragraph}#{line_break}"
    puts "\tTotal students: #{self.total_students}#{line_break}"
    puts "\tAttendance rate: #{self.attendance_rate}#{line_break}"
    puts "\tGraduation rate: #{self.graduation_rate}#{line_break}"
    puts "\tCollege career rate: #{self.college_career_rate}#{line_break}"
    puts "\tExtracurricular activites: #{self.extracurricular_activities}#{line_break}"
    puts "_" * 75
  end


end
