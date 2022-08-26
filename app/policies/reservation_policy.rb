class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

    def create?
      true
    end

    def show?
      true
    end

    def my_reservations?
      true
    end
end
