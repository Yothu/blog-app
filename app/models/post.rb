class Post < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  has_many :likes, class_name: 'Like'
  has_many :comments, class_name: 'Comment'

  def update_user_post_counter
    if user.posts_counter.nil?
      user.update(posts_counter: 1)
    else
      user.update(posts_counter: user.posts_counter + 1)
    end
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
