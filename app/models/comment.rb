class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_create :update_post_comment_counter

  def update_post_comment_counter
    post.increment!(:comments_counter)
  end

  private :update_post_comment_counter
end
