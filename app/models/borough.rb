class Borough < ActiveRecord::Base
  belongs_to :mayor
  has_many :subway_stops
  has_many :schools


  #TODO input verification
  #TODO consider whether instance or class method



  def self.find_schools(borough)
    borough = borough.titlecase
    Borough.find_by(name: borough).schools
  end

  def self.count_schools(borough)
    borough = borough.titlecase
    Borough.find_by(name: borough).schools.count
  end

  def self.find_accessible_subways(borough)
    borough = borough.titlecase
    Borough.find_by(name: borough).subway_stops
  end

  def self.count_accessible_subways(borough)
    borough = borough.titlecase
    Borough.find_by(name: borough).subway_stops.count
  end

  def self.graduation_rate_by_borough(borough)
    total = Borough.find_schools(borough).sum(:graduation_rate)
    count = Borough.count_schools(borough)
    average = (total/count).round(2)
  end # end of graduation rate by borough

  


end
