class SchoolSubwayStop < ActiveRecord::Base
  belongs_to :subway_stop
  belongs_to :school
end
