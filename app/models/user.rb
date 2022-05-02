class User < ActiveRecord::Base
  has_many :posts, foreign_key: 'author_id', class_name: 'Post'
  has_many :likes, foreign_key: 'author_id', class_name: 'Like'
  has_many :comments, foreign_key: 'author_id', class_name: 'Comment'

  def most_recent_posts
    posts.limit(3).order(created_at: :desc)
  end
end
