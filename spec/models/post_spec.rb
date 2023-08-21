require 'rails_helper'

RSpec.describe Post, type: :model do
  @user = User.new(name: 'Emmy', photo: 'https://photo.url', bio: 'My Second Bio', posts_counter: 0)
  subject do
    Post.new(author: @user, title: 'Post title for fun',
             text: 'Lorem Ipsum Dolor sit amet. Lorem Ipsum Dolor sit amet.')
  end

  before { subject.save }

  it 'should have an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'should have a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it '#likes_counter is greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it '#comments_counter is greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should update the author\'s posts_counter' do
    new_user = User.create(name: 'Salim', photo: 'https://photo.url', bio: 'I am a good boy', posts_counter: 0)
    Post.create(author: new_user, title: 'This is yours', text: 'Lorem Ipsum again!',
                comments_counter: 0, likes_counter: 0)
    expect(new_user.posts_counter).to eq(1)
  end

  it '#five_recente_comments returns correct value' do
    new_user = User.create(name: 'Salim', photo: 'https://photo.url', bio: 'I am a good boy', posts_counter: 0)
    new_post = Post.create(author: new_user, title: 'This is yours', text: 'Lorem Ipsum again!',
                           comments_counter: 0, likes_counter: 0)
    expect(new_post.five_recent_comments.length).to be <= 5
  end
end
