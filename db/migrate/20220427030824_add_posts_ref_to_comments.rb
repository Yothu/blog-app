class AddPostsRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post_id, null: false, foreign_key: true
    add_index :comments, :post_id
  end
end
