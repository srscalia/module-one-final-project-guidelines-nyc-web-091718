class CreateBoroughs < ActiveRecord::Migration[5.0]
  def change
    create_table :boroughs do |t|
      t.string :name
      t.integer :mayor_id
    end
  end
end
