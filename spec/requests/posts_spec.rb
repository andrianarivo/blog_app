require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /users/:id/posts" do
    it "renders the index action with index view" do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response).to render_template('posts/index')
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /users/:id/posts/:id' do
    it 'renders the show action with show view' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response).to render_template('posts/show')
      expect(response.body).to include('Here is a details page for a specific post for a given user')
    end
  end
end
