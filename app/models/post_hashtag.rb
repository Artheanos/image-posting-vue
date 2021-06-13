# frozen_string_literal: true

class PostHashtag < ApplicationRecord
  belongs_to :image_post
  belongs_to :hashtag
end
