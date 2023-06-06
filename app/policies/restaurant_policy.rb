class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.all
      # Scope is the same as your entire class
      # scope.all == Restaurant.all
      scope.where(user: user)
    end
  end

  def show?
    true # == Anyone can do this action
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    # Check if the signed in user, is the owner of the instance
    record.user == user # this is a comparison, returns true or false
  end

  def destroy?
    record.user == user
  end
end
