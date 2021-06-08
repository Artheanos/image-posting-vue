# frozen_string_literal: true

module Api
  class CommentSerializer < ApplicationSerializer
    attributes :id, :content, :created_at, :updated_at, :user

    # user method had to be used because for some reason belongs_to doesnt work
    # when nested in image_post_serializer
    # belongs_to :user
    def user
      UserSerializer.new(object.user)
    end
  end
end
