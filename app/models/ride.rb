class Ride < ActiveRecord::Base
  attr_protected
  has_many :hotspots
end
