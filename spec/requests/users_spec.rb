require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://placehold.co/200x133', bio: 'Teacher from Mexico.',
                        posts_counter: 0)
  end

  describe 'GET /users' do
    it 'renders the index action with index view' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response).to render_template('users/index')
    end
  end

  describe 'GET /users/:id' do
    it 'renders the show action with show view' do
      get "/users/#{@user.id}"
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response).to render_template('users/show')
    end
  end
end
