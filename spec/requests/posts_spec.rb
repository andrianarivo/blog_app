require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://placehold.co/200x133', bio: 'Teacher from Mexico.',
                        posts_counter: 0)
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                        likes_counter: 0)
  end

  describe 'GET /users/:id/posts' do
    it 'renders the index action with index view' do
      get "/users/#{@user.id}/posts"
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response).to render_template('posts/index')
    end
  end

  describe 'GET /users/:id/posts/:id' do
    it 'renders the show action with show view' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response).to render_template('posts/show')
    end
  end
end
