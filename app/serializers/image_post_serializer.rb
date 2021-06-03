# frozen_string_literal: true

class ImagePostSerializer < ApplicationSerializer
  attributes :id, :header, :image

  include Rails.application.routes.url_helpers

  def image
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end
end
