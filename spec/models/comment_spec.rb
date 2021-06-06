# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:content).of_type(:string) }
    it { is_expected.to have_db_index(:image_post_id) }
    it { is_expected.to have_db_index(:user_id) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:image_post) }
    it { is_expected.to belong_to(:user) }
  end
end
