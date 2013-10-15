class Goal < ActiveRecord::Base
  attr_restricted
  belongs_to :user
end
