class AddAttachmentGpxToRides < ActiveRecord::Migration
  def self.up
    change_table :rides do |t|
      t.attachment :gpx
    end
  end

  def self.down
    drop_attached_file :rides, :gpx
  end
end
