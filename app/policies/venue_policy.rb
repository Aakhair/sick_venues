class VenuePolicy < ApplicationPolicy
  class Scope < Scope
    # un comment if we have an admin
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update
    record.user == user
  end
end
