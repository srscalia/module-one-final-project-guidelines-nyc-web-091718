require 'rest-client'
require 'json'
require 'pry'
require 'soda/client'


# Creates new Client Instance with Soda-Ruby gem

school_data = SODA::Client.new({:domain => "data.cityofnewyork.us", :app_token => ENV['API_KEY']})

# ### Gets boroughs ###
#
# def get_boroughs(school_data)
#   boroughs = school_data.get("h7rb-945c", :$select => "borough")
#   boroughs = boroughs.uniq
#   boroughs.pop
#   boroughs.map do |hash|
#     hash["borough"].strip
#   end
# end
#
# ### END GET BOROUGHS ###

### Gets subway stops

def get_subways(school_data)
  subways = school_data.get("h7rb-945c", :$select => "subway")
  subways = subways.map do |hash|
    hash["subway"]
  end
end

unformatted = get_subways(school_data)
binding.pry

def format_subways(unformatted)
  unformatted.map do |object|
    if object.include? ";"
      object.split(";")
    else
      object
    end
  end.flatten.uniq.sort
end

### END GET SUBWAYS ###

### Get schools ###

def get_schools(school_data)
  columns = "school_name, borough, attendance_rate, college_career_rate, extracurricular_activities, graduation_rate, neighborhood, overview_paragraph, psal_sports_boys, psal_sports_girls, psal_sports_coed, subway, total_students"
  schools = school_data.get("h7rb-945c", :$select => columns)
end

### END GET SCHOOLS ###
# binding.pry
# puts "hi"
