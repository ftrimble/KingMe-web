class AddRideIdToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :ride_id, :integer
  end
end
