require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validations Testing' do
    before(:all) do
      @user = User.new(name: 'Marie Curie', posts_counter: 0)
      @user.save
    end

    subject { Post.new(title: 't100', text: 'yehaa', comments_counter: 1, likes_counter: 0, author_id: @user.id) }


    before { subject.save }

    it 'should be valid if the title is t100' do
      expect(subject).to be_valid
    end

    it 'should not be valid if the title is nil' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'should not be valid if the title is 251 characters long' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end

    it 'should be valid if comments_counter is 0' do
      expect(subject).to be_valid
    end

    it 'should not be valid if comments_counter is string' do
      subject.comments_counter = 'bye'
      expect(subject).to_not be_valid
    end

    it 'should not be valid if comments_counter is -2' do
      subject.comments_counter = -7
      expect(subject).to_not be_valid
    end

    it 'should be valid if likes_counter is 0' do
      expect(subject).to be_valid
    end

    it 'should not be valid if likes_counter is string' do
      subject.likes_counter = 'wha?'
      expect(subject).to_not be_valid
    end

    it 'should not be valid if likes_counter is -2' do
      subject.likes_counter = -9
      expect(subject).to_not be_valid
    end

    it 'should increase author\'s posts_counter by 1 on creation' do
      expect(subject.author.posts_counter).to eq(1)
    end

    it 'should return 5 comments when calling the most_recent_comments method' do
      (1..7).each do
        Comment.create(text: 'vary texty', author_id: @user.id, post_id: subject.id)
      end

      expect(subject.most_recent_comments.length).to eq(5)
    end

    it 'shoud reduce text longer that 200 character with reduced_text' do
      subject.text = 'a' * 500
      expect(subject.reduced_text.length).to eq(203)
    end

    it 'shoud return true when a user liked the post' do
      Like.create(author_id: @user.id, post_id: subject.id)
      expect(subject.liked?(@user)).to eq(true)
    end
  end
end
