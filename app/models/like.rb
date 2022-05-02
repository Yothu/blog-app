class Like < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_post_like_counter

  def update_post_like_counter
    post.increment!(:likes_counter)
  end

  private :update_post_like_counter
end
