class Group < ActiveRecord::Base
  has_many :group_memberships
  attr_protected
end
