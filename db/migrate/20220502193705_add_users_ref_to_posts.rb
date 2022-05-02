class AddUsersRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :posts, :users, column: :author_id
  end
end
