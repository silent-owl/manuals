class Ability
  include CanCan::Ability
  def initialize(user)
    can :read, :all
    if user.present?
        if (user.role == "user")
            can :create, Manual
            can :manage, Manual do |m|
                m.user == user
            end
            can :manage, User do |u|
                u.id == user.id
            end
        end
        if (user.role == "admin")
            can :access, :rails_admin   # grant access to rails_admin
            can :read, :dashboard       # grant access to the dashboard
            can :create, Manual
            can :manage, :all
        end  
        if (user.role == "banned")
            cannot :create, Manual
            cannot :read, :all
        end   
    end
        
  end
end
