class AddUsersRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :author_id, null: false, foreign_key: true
    add_index :likes, :author_id
  end
end
