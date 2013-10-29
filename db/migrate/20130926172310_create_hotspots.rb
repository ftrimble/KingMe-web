class CreateHotspots < ActiveRecord::Migration
  def change
    create_table :hotspots do |t|
      t.string :location
      t.string :length
      t.string :avg_incline
      
      t.integer :ride_id

      t.timestamps
    end
  end
end
