class VoucherPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def edit?
    record.benefit.store.user == user
  end

  def show?
    return true
  end

  def update?
    record.benefit.store.user == user
  end

  def destroy?
    record.benefit.store.user == user
  end
end

