class Group < ActiveRecord::Base
  has_many :group_memberships
  has_many :users
  attr_protected
end
