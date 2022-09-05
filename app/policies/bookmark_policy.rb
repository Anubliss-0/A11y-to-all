class BookmarkPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    true
  end

  def destroy?
    # list = List.find(record.list_id)
    # return true if list.user_id == user
    record.list.user == user
  end
end
