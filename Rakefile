require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end # End Console Task

desc 'fill boroughs table'
task :fill_boroughs do
  Borough.create(name: "Bronx")
  Borough.create(name: "Manhattan")
  Borough.create(name: "Queens")
  Borough.create(name: "Brooklyn")
  Borough.create(name: "Staten Island")
end # End Console Task

desc 'fill subways table with API info'
task :fill_subways do
  get_subways.each do |subway_hash|
    subway_stop = SubwayStop.new()
    subway_stop.name = subway_hash["subway"]
    if subway_hash["borough"].capitalize.include? "Bronx"
      # Assign Brooklyn ID of 3
      subway_stop.borough_id = 1
    elsif subway_hash["borough"].capitalize.include? "Manhattan"
      # Assign Manhattan ID of 4
      subway_stop.borough_id = 2
    elsif subway_hash["borough"].capitalize.include? "Queens"
      # Assign Bronx ID of 2
      subway_stop.borough_id = 3
    elsif subway_hash["borough"].capitalize.include? "Brooklyn"
      # Assign Queens ID of 5
      subway_stop.borough_id = 4
    elsif subway_hash["borough"].capitalize.include? "Staten"
      # Assign Staten ID of 6
      subway_stop.borough_id = 5
    else
      puts "ERROR"
    end
    subway_stop.save
  end
end # End Console Task




desc 'fill schools table with API info'
task :fill_schools do
  # Create SCHOOLS
  get_schools.each do |school|
    s = School.new()
    s.name = school["school_name"]
    s.overview_paragraph = school["overview_paragraph"]
    s.graduation_rate = school["graduation_rate"].to_f
    s.total_students = school["total_students"]
    s.attendance_rate = school["attendance_rate"].to_f
    s.college_career_rate = school["college_career_rate"].to_f
    s.extracurricular_activities = school["extracurricular_activities"]

    # If school exists with this name already, it's already in the DB.

    # NOTE that IDs are correct yet, due to not clearing DB correctly
    # Logic for assigning borough ID to school

    # Benjamin N. Cardozo High School has missing borough data in API.
    # Manually correct to Queens
    if school["school_name"] == "Benjamin N. Cardozo High School"
      s.borough_id = 3
    elsif school["borough"].capitalize.include? "Bronx"
      # Assign Brooklyn ID of 3
      s.borough_id = 1
    elsif school["borough"].capitalize.include? "Manhattan"
      # Assign Manhattan ID of 4
      s.borough_id = 2
    elsif school["borough"].capitalize.include? "Queens"
      # Assign Bronx ID of 2
      s.borough_id = 3
    elsif school["borough"].capitalize.include? "Brooklyn"
      # Assign Queens ID of 5
      s.borough_id = 4
    elsif school["borough"].capitalize.include? "Staten"
      # Assign Staten ID of 6
      s.borough_id = 5
    else
      puts "ERROR"
    end
    s.save
  end
end # End Fill_Schools Task


desc 'fills join table between subway stops and schools'
task :fill_join do
  get_schools_and_subways.each do |sss|
    s = SchoolSubwayStop.new()
    s.school_id = School.find_by(name: sss["school_name"]).id
    s.subway_stop_id = SubwayStop.find_by(name: sss["subway"]).id
    s.save
  end
end # End Console Task
