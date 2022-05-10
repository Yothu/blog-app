require 'rails_helper'

RSpec.describe 'Users controller', type: :system do
  describe 'index action' do
    before(:each) do
      User.create(name: 'user1', photo: 'https://vetstreet-brightspot.s3.amazonaws.com/ad/fb05e024dc11e1ad9e005056b5004b/file/fat%20cat%20sitting%20in%20the%20corner.jpg ', password: '123123', email: 'u@u', posts_counter: 5, confirmed_at: Time.now)
      User.create(name: 'user2', photo: 'https://vetstreet-brightspot.s3.amazonaws.com/ad/fb05e024dc11e1ad9e005056b5004b/file/fat%20cat%20sitting%20in%20the%20corner.jpg ', password: '123123', email: 'u@i', posts_counter: 5, confirmed_at: Time.now)
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

    # it 'When I click the submit button after filling in the username and the password with correct data, I am redirected to the root page' do
    #   fill_in 'Email', with: 'u@u'
    #   fill_in 'Password', with: '123123'
    #   click_button 'Login'
    #   expect(page).to have_content('Current User: ')
    # end
  end
end