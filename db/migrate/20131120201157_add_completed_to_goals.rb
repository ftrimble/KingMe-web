class AddCompletedToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :completed, :boolean
  end
end
