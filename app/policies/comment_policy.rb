class CommentPolicy < ApplicationPolicy
  def create?
    user.present? && (record.user == user || user.role?(:admin) || user.role?(:moderator))
  end

  def destroy?
    create?
  end
end