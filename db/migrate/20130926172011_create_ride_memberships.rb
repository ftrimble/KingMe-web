class CreateRideMemberships < ActiveRecord::Migration
  def change
    create_table :ride_memberships do |t|
      t.integer :ride_id
      t.integer :user_id
      t.string :ride_date

      t.timestamps
    end
  end
end
