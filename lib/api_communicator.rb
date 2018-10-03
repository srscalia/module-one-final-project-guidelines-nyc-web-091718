require 'rest-client'
require 'json'
require 'pry'
require 'soda/client'


# Creates new Client Instance with Soda-Ruby gem
def client
  SODA::Client.new({:domain => "data.cityofnewyork.us", :app_token => ENV['API_KEY']})
end

### Gets subway stops

def api_subways
  subways = client.get("h7rb-945c", :$select => "subway, borough")
  subways.uniq
end

def get_subways
  subways_array = []

  api_subways.each do |hash|
    if hash["subway"] != "N/A"
      if hash["subway"].include? ";"
        # Make value into a properly formatted array of stops.
        hash["subway"] = hash["subway"].split(";")
        # Iterate over the new array of subways (hash["subway"])
        # Create a new hash from borough, and each subway stop,
        # Add that to our subway
        hash["subway"].each do |subway_stop|
          borough = hash.keys[0]
          subway = hash.keys[1]
          new_hash = {borough => hash[borough], subway => subway_stop.strip}
          subways_array << new_hash
        end
      else # The subway stop is just a string of one string.
        subways_array << hash
      end
    end
  end
  subways_array.uniq
end

### END GET SUBWAYS ###

### Get schools ###

def get_schools
  #   columns = "school_name, borough, attendance_rate, college_career_rate, extracurricular_activities, graduation_rate, neighborhood, overview_paragraph, psal_sports_boys, psal_sports_girls, psal_sports_coed, subway, total_students"
  columns = "school_name, borough"
  schools = client.get("h7rb-945c", :$select => columns)
end

### END GET SCHOOLS ###





### Gets subway stops

def api_schools_and_subways
  school_and_subways = client.get("h7rb-945c", :$select => "school_name, subway, borough")
  binding.pry
  school_and_subways.uniq
  binding.pry
end

def get_schools_and_subways
  subways_array = []

  api_subways.each do |hash|
    if hash["subway"] != "N/A"
      if hash["subway"].include? ";"
        # Make value into a properly formatted array of stops.
        hash["subway"] = hash["subway"].split(";")
        # Iterate over the new array of subways (hash["subway"])
        # Create a new hash from borough, and each subway stop,
        # Add that to our subway
        hash["subway"].each do |subway_stop|
          borough = hash.keys[0]
          subway = hash.keys[1]
          new_hash = {borough => hash[borough], subway => subway_stop.strip}
          subways_array << new_hash
        end
      else # The subway stop is just a string of one string.
        subways_array << hash
      end
    end
  end
  subways_array.uniq
end

### END GET SUBWAYS ###
