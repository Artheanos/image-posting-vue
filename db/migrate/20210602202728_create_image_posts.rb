# frozen_string_literal: true

class CreateImagePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :image_posts do |t|
      t.string :header

      t.timestamps
    end
  end
end
