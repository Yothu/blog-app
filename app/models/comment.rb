class Comment < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def update_post_comment_counter
    if post.comments_counter != post.comments.length
      post.update(comments_counter: post.comments.length)
  end
end
