class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :goals
  has_many :group_memberships
  has_many :ride_memberships

  #before_save :add_role
  attr_protected 

end
