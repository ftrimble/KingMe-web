class GroupMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  attr_protected
end
