# frozen_string_literal: true

class Hashtag < ApplicationRecord
  validates :name, presence: true
  has_many :post_hashtags
end
