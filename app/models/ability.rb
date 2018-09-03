class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new 
    
    if (user.role == "user")
        can :read, :all
        can :create, Manual
        can :manage, Manual do |m|
            m.user == user
        end
        can :manage, User do |u|
            u.id == user.id
        end
        can :manage, Step do |step|
            step.manual.user == user
        end
    end
    if (user.role == "admin")
        can :access, :rails_admin   
        can :read, :dashboard       
        can :create, Manual
        can :manage, :all
    end  
    if (user.role == "banned")
        cannot :create, Manual
        cannot :read, :all
        can :manage, User do |u|
            u.id == user.id
        end
    end   
    if user.role == nil

    end

  end
end
