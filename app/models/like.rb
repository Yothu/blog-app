class Like < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def update_post_like_counter
    if post.likes_counter.nil?
      post.update(likes_counter: 1)
    else
      post.update(likes_counter: post.likes_counter + 1)
    end
  end
end
