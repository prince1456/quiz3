class Ability
  include CanCan::Ability

    def initialize(user)
      user ||= User.new



        if user.admin?
          can :manage, :all
        else
          can :read, :all
        end

        can :manage, Idea do |ide|
            user == ide.user
        end


        can :like, Idea do |ide|
          user != ide.user
        end

        cannot :like, Idea do |ide|
          user == ide.user
        end

        can :destroy, Like do |like|
         user == like.user
       end


       can :membership, Idea do |ide|
         user != ide.user
       end
       cannot :membership, Idea do |ide|
         user == ide.user
       end
       can :destroy, Membership do |member|
        user == member.user
      end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
