# frozen_string_literal: true

module Api
  class CommentSerializer < ApplicationSerializer
    attributes :id, :content, :user
    # def attributes(requested_attrs = nil, reload = nil)
    #   object.attributes.symbolize_keys
    # end
    def user
      UserSerializer.new(object.user)
    end
    belongs_to :user
  end
end
