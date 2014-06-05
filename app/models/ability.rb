class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.has_role? :admin
      can :manage, :all
      
    else
      can :read, :all
      #can :create, Comment
      #can :create, :all
      #can :update, :all
      can :update, Comment do |comment|
        comment.try(:user) == user || (user.has_role? :moderator)
      end
      if user.has_role? :author
        can :create, Comment
        can :create, Article
        can :update, Article do |article|
          article.try(:user) == user
        end
      end
    end
  end
end
