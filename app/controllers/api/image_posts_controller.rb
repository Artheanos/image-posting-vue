# frozen_string_literal: true

module Api
  class ImagePostsController < ApplicationController
    def index
      render json: ImagePost.all.map { |i| i.as_json.merge(image: rails_blob_url(i.image)) }
    end

    def create
      image_post = ImagePost.new(create_params)

      if image_post.save
        render json: {}, status: :created
      else
        render json: {}, status: :unprocessable_entity
      end
    end

    def avatar
      render json: 'avatar'
    end

    private

    def create_params
      params.require(:image_post).permit(:header, :image)
    end
  end
end
