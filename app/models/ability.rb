class Ability
  include CanCan::Ability

  def initialize(user)
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

    # Check if the user is signed in
    signed_in = user.present?

    user ||= User.new # guest user (not logged in)

    # Anyone can read data without restrictions
    can :read, :all

    # User creation is not restricted
    can :create, User

    if user.admin?
      # Admin users can manage anything
      can :manage, :all
    else
      # This is where we place non-admin management restrictions
      # cannot :read, User // for example
    end

    if signed_in
      can :manage, User, id: user.id
    end
  end
end
