require 'rails_helper'

describe Comment, type: :model do
  @user = User.new(name: 'Constance', photo: 'http://photo.url', bio: 'I am preserve')
  @post = Post.new(author: @user, title: 'New Post!', text: 'Text for new POst')

  subject { Comment.create(post: @post, author: @user, text: 'Here you have a comment') }

  before { subject.save }

  it 'should have an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'should have a post' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  it 'should update #comments_counter' do
    new_user = User.create(name: 'Sammy', photo: 'https://photo.url', bio: 'Test bio', posts_counter: 0)
    new_post = Post.create(author: new_user, title: 'Here title', text: 'Text of the post',
                           comments_counter: 0, likes_counter: 0)
    Comment.create(post: new_post, author: new_user, text: 'New awesome comment')
    expect(new_post.comments_counter).to eq(1)
  end
end
