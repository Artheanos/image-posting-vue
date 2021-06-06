# frozen_string_literal: true

class ImagePostPolicy < ApplicationPolicy
  def create?
    logged_in?
  end

  def destroy?
    @user.id == @record.user_id
  end
end
