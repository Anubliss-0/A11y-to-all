class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(sender_id: user).or(scope.where(recipient_id: user))
    end
  end

  def create?
    true
  end

  def show?
    record.sender_id == user.id || record.recipient_id == user.id
  end

  def chat_with_user?
    true
  end
end
