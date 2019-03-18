class BenefitPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(store: store)
    end
  end

  def create?
    record.store.user == user
  end

  def edit?
    record.store.user == user
  end

  def show?
    return true
  end

  def update?
    record.store.user == user
  end

  def destroy?
    record.store.user == user
  end
end
