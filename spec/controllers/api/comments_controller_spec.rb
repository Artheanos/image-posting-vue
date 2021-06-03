# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::CommentsController, type: :controller do
  let(:image_post) { create(:image_post) }
  describe '#index' do
    it 'dupa' do
      pp image_post
    end
  end
end
