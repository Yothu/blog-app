class AddUsersRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :likes, :users, column: :author_id, on_delete: :cascade
  end
end
