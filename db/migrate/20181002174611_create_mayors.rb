class CreateMayors < ActiveRecord::Migration[5.0]
  def change
    create_table :mayors do |t|
      t.string :name
    end
  end
end
