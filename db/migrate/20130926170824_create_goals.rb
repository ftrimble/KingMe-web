class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :hotspot_id
      t.string :time

      t.timestamps
    end
  end
end
