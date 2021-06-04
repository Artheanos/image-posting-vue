# frozen_string_literal: true

module Api
  class ImagePostsController < ApplicationController
    before_action :set_image_post, only: %i[show destroy]

    def index
      render json: ImagePost.includes(:comments).reverse_order
    end

    def create
      image_post = ImagePost.new(create_params)

      if image_post.save
        render json: {}, status: :created
      else
        render json: {}, status: :unprocessable_entity
      end
    end

    def show
      render json: @image_post, serializer: Api::SingleImagePostSerializer
    end

    def destroy
      @image_post.image.purge
      @image_post.destroy
      render json: {}, status: :ok
    end

    def avatar
      render json: 'avatar'
    end

    private

    def create_params
      params.require(:image_post).permit(:header, :image, :user_id)
    end

    def set_image_post
      @image_post = ImagePost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: {}, status: :unprocessable_entity
    end
  end
end
