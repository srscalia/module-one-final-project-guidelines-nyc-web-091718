require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end # End Console Task


desc 'fill subways table with API info'
task :fill_subways do
  get_subways.each do |subway_hash|
    subway_stop = SubwayStop.new()
    subway_stop.name = subway_hash["subway"]
    if subway_hash["borough"].capitalize.include? "Brooklyn"
      # Assign Brooklyn ID of 3
      subway_stop.borough_id = 3
    elsif subway_hash["borough"].capitalize.include? "Manhattan"
      # Assign Manhattan ID of 4
      subway_stop.borough_id = 4
    elsif subway_hash["borough"].capitalize.include? "Bronx"
      # Assign Bronx ID of 2
      subway_stop.borough_id = 2
    elsif subway_hash["borough"].capitalize.include? "Queens"
      # Assign Queens ID of 5
      subway_stop.borough_id = 5
    elsif subway_hash["borough"].capitalize.include? "Staten"
      # Assign Staten ID of 6
      subway_stop.borough_id = 6
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

    # If school exists with this name already, it's already in the DB.

    # NOTE that IDs are correct yet, due to not clearing DB correctly
    # Logic for assigning borough ID to school

    # Benjamin N. Cardozo High School has missing borough data in API.
    # Manually correct to Queens
    if school["school_name"] == "Benjamin N. Cardozo High School"
      s.borough_id = 5
    elsif school["borough"].capitalize.include? "Brooklyn"
      # Assign Brooklyn ID of 3
      s.borough_id = 3
    elsif school["borough"].capitalize.include? "Manhattan"
      # Assign Manhattan ID of 4
      s.borough_id = 4
    elsif school["borough"].capitalize.include? "Bronx"
      # Assign Bronx ID of 2
      s.borough_id = 2
    elsif school["borough"].capitalize.include? "Queens"
      # Assign Queens ID of 5
      s.borough_id = 5
    elsif school["borough"].capitalize.include? "Staten"
      # Assign Staten ID of 6
      s.borough_id = 6
    else
      puts "ERROR"
    end
    s.save
  end
end # End Fill_Schools Task
