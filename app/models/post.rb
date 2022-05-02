class Post < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  has_many :likes, class_name: 'Like'
  has_many :comments, class_name: 'Comment'

  def update_user_post_counter
    if user.posts_counter != user.posts.length
      user.update(posts_counter: user.posts.length)
  end

  def most_recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
