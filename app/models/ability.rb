class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
   
    if user.admin?
      can :manage, :all
    else
      if user.group_manager?
      end
      if user.group_member?
      end
      if user.member?  
        can :create, :ride
        can :read, :ride
        can :join, :group
        can :leave, :group
      end
    end 
  end
end
