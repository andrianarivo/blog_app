require 'rails_helper'

RSpec.describe Like, type: :model do
  @user = User.new(name: 'Gloria', photo: 'https://photo.url', bio: 'I am beautiful')
  @post = Post.new(author: @user, title: 'My post', text: 'Everyone, look here!')

  subject { Like.create(post: @post, author: @user) }

  before { subject.save }

  it 'should have an author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'should have a post' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  it 'should update #likes_counter' do
    new_user = User.create(name: 'Gloria2', photo: 'https://photo.url', bio: 'Here I come!', posts_counter: 0)
    new_post = Post.create(author: new_user, title: 'I post again!', text: 'And everyone is listening',
                           comments_counter: 0, likes_counter: 0)
    Like.create(post: new_post, author: new_user)
    expect(new_post.likes_counter).to eq(1)
  end
end
