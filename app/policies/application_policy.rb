class ApplicationPolicy
  attr_reader :teacher, :record

  def initialize(teacher, record)
    @teacher = teacher
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(teacher, record.class)
  end

  class Scope
    attr_reader :teacher, :scope

    def initialize(teacher, scope)
      @teacher = teacher
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
