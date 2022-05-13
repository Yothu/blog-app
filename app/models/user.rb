class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #  , :confirmable

  has_many :posts, foreign_key: 'author_id', class_name: 'Post', dependent: :delete_all
  has_many :likes, foreign_key: 'author_id', class_name: 'Like', dependent: :delete_all
  has_many :comments, foreign_key: 'author_id', class_name: 'Comment', dependent: :delete_all

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent_posts
    posts.limit(3).order(created_at: :desc)
  end

  def admin?
    return true if role == 'admin'

    false
  end

  def correct_token?(token)
    return true if apitoken == token

    false
  end
end
