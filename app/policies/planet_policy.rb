class PlanetPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    return create?
  end

  def create?
    return true
  end

  def edit?
    return true
  end

  def update?
    return edit?
  end
end
