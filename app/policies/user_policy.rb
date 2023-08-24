class UserPolicy < ApplicationPolicy

  def index?
    user.admin? || user.id
  end

  def show?
    user.admin? || user.id == @record.id
  end

  def create?
    user.admin
  end

  def new?
    create?
  end

  def update?
    user.admin? || user.id == @record.id
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || user.id == @record.id
  end

end
