class AddPostsRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :comments, :posts, column: :post_id, on_delete: :cascade
  end
end
