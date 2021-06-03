# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::CommentsController, type: :controller do
  let(:image_post) { create(:image_post) }
  let(:image_post_id) { image_post.id }

  let(:comment_params) do
    { comment: { content: 'hello world', image_post_id: image_post_id } }
  end

  describe '#create' do
    before { post :create, params: comment_params }

    context 'when params are valid' do
      it 'creates a comment with proper params' do
        expect(Comment.first.as_json).to include('content' => 'hello world')
      end
    end

    context 'when params are invalid' do
      let(:image_post_id) { image_post.id + 1 }

      it 'does not create a comment' do
        expect(Comment.count).to be 0
      end
    end
  end

  describe '#destroy' do
    let(:comment) { create(:comment) }
    let(:comment_id) { comment.id }
    let(:action) { delete :destroy, params: { id: comment_id } }

    context 'when params are valid' do
      it 'deletes a comment' do
        comment
        expect { action }.to change { Comment.count }.by(-1)
      end
    end

    context 'when params are invalid' do
      let(:comment_id) { comment.id + 1 }

      it 'does not delete a comment' do
        comment
        expect { action }.to change { Comment.count }.by 0
      end
    end
  end
end
