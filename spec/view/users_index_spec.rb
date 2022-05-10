require 'rails_helper'

RSpec.describe 'Users controller', type: :system do
  describe 'index action' do
    before(:each) do
      User.create(id:1234, name: 'user1', bio: 'This is the bio for user1' , photo: 'https://vetstreet-brightspot.s3.amazonaws.com/ad/fb05e024dc11e1ad9e005056b5004b/file/fat%20cat%20sitting%20in%20the%20corner.jpg ', password: '123123', email: 'u@u', posts_counter: 5, confirmed_at: Time.now)
      User.create(id:1235, name: 'user2', bio: 'This is the bio for user2' , photo: 'https://vetstreet-brightspot.s3.amazonaws.com/ad/fb05e024dc11e1ad9e005056b5004b/file/fat%20cat%20sitting%20in%20the%20corner.jpg ', password: '123123', email: 'u@i', posts_counter: 5, confirmed_at: Time.now)
      visit new_user_session_path
      fill_in 'Email', with: 'u@u'
      fill_in 'Password', with: '123123'
      click_button 'Login'
    end

    it 'I can see the username of all other users' do
      expect(page).to have_content('user1')
      expect(page).to have_content('user2')
    end

    it 'I can see the profile picture for each user' do
      expect(page).to have_selector('img')
    end
    
    it 'I can see the number of posts each user has written' do
      expect(page).to have_content('Posts: 5')
    end

    it "When I click on a user, I am redirected to that user's show page" do
      click_link 'user1'
      expect(page).to have_content('This is the bio for user1')
    end
  end
end
