class BillPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    record.teacher == teacher
  end

  def create?
    record.teacher == teacher
  end

  def show?
    record.teacher == teacher
  end

  def edit?
    record.teacher == teacher
  end

  def update?
    record.teacher == teacher
  end

  def destroy?
    record.teacher == teacher
  end
end
