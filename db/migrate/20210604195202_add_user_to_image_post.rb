class AddUserToImagePost < ActiveRecord::Migration[6.1]
  def change
    add_reference :image_posts, :user, null: false, foreign_key: true
  end
end
