class Like < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def update_post_like_counter
    post.update(likes_counter: post.likes.length) if post.likes_counter != post.likes.length
  end
end
