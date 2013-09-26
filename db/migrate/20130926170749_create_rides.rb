class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
