require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(id: 1, name: 'Ali') }

  before { subject.save }

  describe 'validation tests' do
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be integer' do
      subject.posts_counter = 'hey'
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be greater than or equal to zero' do
      subject.posts_counter = -2
      expect(subject).to_not be_valid
      subject.posts_counter = 0
      expect(subject).to be_valid
    end
  end

  describe '#three_most_recent_posts' do
    it 'returns the 3 most recent posts' do
      # Arrange
      user = User.create(id: 2, name: 'David')
      post1 = Post.create(title: 'post1', author: subject, created_at: 3.day.ago)
      post2 = Post.create(title: 'post2', author: subject, created_at: 2.day.ago)
      post3 = Post.create(title: 'post3', author: subject, created_at: 1.day.ago)

      # Act
      recent_posts = user.three_most_recent_posts

      # Assert
      expect(recent_posts).to eq([post3, post2, post1])
    end
  end
end