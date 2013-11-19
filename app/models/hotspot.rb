class Hotspot < ActiveRecord::Base
  attr_protected
  belongs_to :ride
  has_many :points, dependent: :destroy

  
end
