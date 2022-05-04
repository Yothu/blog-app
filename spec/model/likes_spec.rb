require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Validations Testing' do
    it 'should increase it\'s post likes_counter by 1 uppon creation' do
      user = User.new(name: 'Marie Curie', posts_counter: 0)
      user.save

      post = Post.new(title: 't100', text: 'yehaa', comments_counter: 1, likes_counter: 0, author_id: user.id)
      post.save

      like = Like.new(author_id: user.id, post_id: post.id)
      like.save

      expect(like.post.likes_counter).to eq(1)
    end
  end
end
