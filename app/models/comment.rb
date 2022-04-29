class Comment < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def update_post_comment_counter
    if post.comments_counter.nil?
      post.update(comments_counter: 1)
    else
      post.update(comments_counter: post.comments_counter + 1)
    end
  end
end
