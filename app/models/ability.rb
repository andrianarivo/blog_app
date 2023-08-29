# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can [:index, :show], User
    can [:new, :create, :show, :index], Post
    can [:new, :create, :show, :index], Comment
    can [:update, :destroy], Post, { author_id: user.id }
    can [:update, :destroy], Comment, { author_id: user.id }
    can :manage, Post if user.is? :admin
    can :manage, Comment if user.is? :admin
  end
end
