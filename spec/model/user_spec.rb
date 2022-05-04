require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations Testing' do
    subject { User.new(name: 'Roberto Carlos', posts_counter: 0) }

    before { subject.save }

    it 'should be valid if the name is Roberto Carlos' do
      expect(subject).to be_valid
    end

    it 'should not be valid if the name is nil' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should be valid if posts_counter is 0' do
      expect(subject).to be_valid
    end

    it 'should not be valid if posts_counter is string' do
      subject.posts_counter = 'hello'
      expect(subject).to_not be_valid
    end

    it 'should not be valid if posts_counter is -2' do
      subject.posts_counter = -2
      expect(subject).to_not be_valid
    end

    it 'should return three posts when calling most_recent_posts' do
      (1..7).each do
        Post.create(title: 'hello!', author_id: subject.id, comments_counter: 1, likes_counter: 0)
      end

      expect(subject.most_recent_posts.length).to eq(3)
    end
  end
end
