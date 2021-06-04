# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:password_digest).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:image_posts).dependent(:destroy) }
  end
end
