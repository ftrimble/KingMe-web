class RideMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :ride
  attr_protected
end
