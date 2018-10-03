class CreateSubwayStops < ActiveRecord::Migration[5.0]
  def change
    create_table :subway_stops do |t|
      t.string :name
      t.integer :borough_id
    end
  end
end
