# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :image_posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
