# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :image_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end