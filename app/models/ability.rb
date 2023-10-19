class Ability
  include CanCan::Ability

  def initialize(user)
    can(:read, [Category, Payment], user:)
    can :create, [Category, Payment], user:
  end
end
