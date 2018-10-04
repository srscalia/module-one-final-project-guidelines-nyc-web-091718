class Borough < ActiveRecord::Base
  belongs_to :mayor
  has_many :subway_stops
  has_many :schools

  def count_schools
    self.schools.count
  end # end of count_schools

  def count_accessible_subways
    self.subway_stops.count
  end # end of count_accessible_subways

  def graduation_rate
    total = self.schools.sum(:graduation_rate)
    count = self.count_schools
    average = (total/count).round(2)
  end # end of graduation rate by borough

  def college_career_rate
    total = self.schools.sum(:college_career_rate)
    count = self.count_schools
    average = (total/count).round(2)
  end # end of college_career_rate

  def print_borough_info
    line_break = "\n\n"
    puts "_" * 59
    puts "#{line_break}Here's a summary of #{self.name} public high schools:#{line_break}"
    puts "\tTotal schools: #{self.count_schools}#{line_break}"
    puts "\tNumber of accessible subways: #{self.count_accessible_subways}#{line_break}"
    puts "\tGraduation rate: #{self.graduation_rate}#{line_break}"
    puts "\tCollege career rate: #{self.college_career_rate}#{line_break}"
    puts "_" * 59
  end # end of print_borough_info


end
