class CreateSchoolSubwayStops < ActiveRecord::Migration[5.0]
  def change
    create_table :school_subway_stops do |t|
      t.integer :school_id
      t.integer :subway_stop_id
    end
  end
end
