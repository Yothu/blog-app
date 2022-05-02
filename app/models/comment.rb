class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def update_post_comment_counter
    post.update(comments_counter: post.comments.length) if post.comments_counter != post.comments.length
  end
end
