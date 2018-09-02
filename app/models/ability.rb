class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
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
        can :access, :rails_admin   # grant access to rails_admin
        can :read, :dashboard       # grant access to the dashboard
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

    # user ||= User.new # guest user (not logged in)

    # if user.role == 'admin'
    #   can :manage, :all
    #   can :access, :rails_admin
    #   can :dashboard      
    # end

    # if user.role == "user"
    #   can [:create], Post
    #   can :update, User do |u|
    #     u == user
    #   end
    #   can :manage, [Post,Step] do |post,step|
    #     post.user == user
    #   end
    #   can :show, [User]
    # end
  end
end
