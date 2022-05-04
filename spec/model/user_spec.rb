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
  end
end
