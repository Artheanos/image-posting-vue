# frozen_string_literal: true

module Api
  class CommentsController < ApplicationController
    def create
      comment = Comment.new(create_params)

      if comment.save
        render json: {}, status: :created
      else
        render json: {}, status: :unprocessable_entity
      end
    end

    private

    def create_params
      params.require(:comment).permit(:content, :image_post_id)
    end
  end
end
