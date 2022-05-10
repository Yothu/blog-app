class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :likes, class_name: 'Like', dependent: :delete_all
  has_many :comments, class_name: 'Comment', dependent: :delete_all

  after_create :update_post_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  def reduced_text
    return text if text.length < 200

    "#{text[0, 200]}..."
  end

  def liked?(user)
    likes.each do |like|
      return true if like.author_id == user.id
    end
    false
  end

  private :update_post_counter
end
