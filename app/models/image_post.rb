# frozen_string_literal: true

class ImagePost < ApplicationRecord
  has_one_attached :image
  validates :header, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :user
end
