require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'Show' do
    before(:each) do
      @u1 = User.create(id: 1234, name: 'user1', bio: 'This is the bio for user1',
                        photo: 'https://cdn.eso.org/images/thumb700x/eso0907a.jpg',
                        password: '123123', email: 'u@u', posts_counter: 0, confirmed_at: Time.now)
      @u2 = User.create(id: 1235, name: 'user2', bio: 'This is the bio for user2',
                        photo: 'https://cdn.eso.org/images/thumb700x/eso0907a.jpg',
                        password: '123123', email: 'u@i', posts_counter: 0, confirmed_at: Time.now)

      @p1 = Post.create(id: 901, title: 'post1', text: 'a generation lost in space', author_id: 1234)
      @p2 = Post.create(id: 902, title: 'post2', text: 'no angel born in hell', author_id: 1234)
      @p3 = Post.create(id: 903, title: 'post3', text: 'the day the music died', author_id: 1234)
      @p4 = Post.create(id: 904, title: 'post4', text: 'bye, bye, miss american pie', author_id: 1234)

      visit new_user_session_path
      fill_in 'Email', with: 'u@u'
      fill_in 'Password', with: '123123'
      click_button 'Login'
      click_link 'user1'
    end

    it 'I can see the user\'s profile picture.' do
      expect(page).to have_selector('img')
    end

    it 'I can see the user\'s username.' do
      expect(page).to have_content('user1')
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content('Posts: 4')
    end

    it 'I can see the user\'s bio.' do
      expect(page).to have_content('This is the bio for user1')
    end

    it 'I can see the user\'s first 3 posts.' do
      expect(page).to have_css('.user-post', count: 3)
    end

    it 'I can see a button that lets me view all of a user\'s posts.' do
      expect(page).to have_content('See all posts')
    end

    it 'When I click a user\'s post, it redirects me to that post\'s show page.' do
      click_on 'post4'
      expect(page.current_path).to eq('/users/1234/posts/904')
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
      click_on 'See all posts'
      expect(page.current_path).to eq('/users/1234/posts')
    end
  end
end
