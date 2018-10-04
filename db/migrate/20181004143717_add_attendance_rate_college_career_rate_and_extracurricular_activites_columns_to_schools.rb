class AddAttendanceRateCollegeCareerRateAndExtracurricularActivitesColumnsToSchools < ActiveRecord::Migration[5.0]
  def change
    add_column  :schools, :attendance_rate, :float
    add_column  :schools, :college_career_rate, :float
    add_column  :schools, :extracurricular_activities, :string
  end
end
