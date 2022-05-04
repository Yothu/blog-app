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
      puts "COM #{subject.comments_counter.class}"
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
      puts "LIK #{subject.likes_counter.class}"
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
  end
end
