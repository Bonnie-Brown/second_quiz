# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end

    alias_action :create, :read, :update, :delete, :to => :crud

    can :crud, Idea do |idea|
      user == idea.user
    end

    can :crud, Review do |review|
      user == review.user
    end

    # can :create, User do |user|
    #   user == user
    # end

    # can :update, User do |password|
    #   user == user.password
    # end

  end
end
