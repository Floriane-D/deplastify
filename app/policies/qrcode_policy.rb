class QrcodePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def edit?
    record.voucher.benefit.store.user == user
  end

  def show?
    return true
  end

  def update?
    record.voucher.benefit.store.user == user
  end

  def destroy?
    record.voucher.benefit.store.user == user
  end
end
