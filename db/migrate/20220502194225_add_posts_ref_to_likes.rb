class AddPostsRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :likes, :posts, column: :post_id
  end
end
