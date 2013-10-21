class Ride < ActiveRecord::Base

  attr_protected
  has_attached_file :gpx
  has_many :hotspots
end
