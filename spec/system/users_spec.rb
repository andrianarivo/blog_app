require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before(:all) do
    @users = User.all
    if @users.nil? || @users.empty?
      User.create(name: 'Tom', photo: 'https://placehold.co/200x133', bio: 'Teacher from Mexico.', posts_counter: 0)
      User.create(name: 'Lilly', photo: 'https://placehold.co/200x133', bio: 'Teacher from Poland.', posts_counter: 0)
      @users = User.all
    end
  end

  describe 'users#index' do
    it 'I can see the username of all other users.' do
      visit '/users'
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
    end

    it 'I can see the profile picture for each user.' do
      visit '/users'
      @users.each do
        expect(page).to have_css("img[src='https://placehold.co/200x133']")
      end
    end

    it 'I can see the number of posts each user has written.' do
      visit '/users'
      @users.each do
        expect(page).to have_content('Number of posts: 0')
      end
    end

    it 'When I click on a user, I am redirected to that user\'s show page.' do
      visit '/users'
      click_link 'Tom'
      expect(page).to have_current_path("/users/#{@users[0].id}")
    end
  end

 describe 'users#show' do
    it 'I can see the user\s profile picture..' do
      visit '/users/1'
        expect(page).to have_css("img[src='https://placehold.co/200x133']")
    end

    it 'I can see the user/s username.' do
      visit '/users/1'
        expect(page).to have_content("Tom")
      
    end

    it 'I can see the number of posts the user has written.' do
      visit '/users/1'
        expect(page).to have_content('Number of posts: 0')
    end

    it 'I can see the user\s bio.' do
      visit '/users/1'
      
      expect(page).to have_content("Teacher from Mexico.")
    end
    it 'I can see the user\s first 3 posts.' do
      visit '/users/1'
      
      expect(page).to have_content(" ")
    end
  end
end

