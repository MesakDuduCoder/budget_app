# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Category, Payment], user: user   
    can :create, [Category, Payment], user: user
  end
end
