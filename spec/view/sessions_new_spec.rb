require 'rails_helper'

RSpec.describe 'Session controller', type: :system do
  describe 'new action' do
    before(:each) do
      User.create(name: 'user1', password: '123123', email: 'u@u', confirmed_at: Time.now)
      visit new_user_session_path
    end

    it 'I can see the username and password inputs and the submit button' do
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_button('Login')
    end

    it 'When I click the submit button after filling in the username and the password with correct data, I am redirected to the root page' do
      fill_in 'Email', with: 'u@u'
      fill_in 'Password', with: '123123'
      click_button 'Login'
      expect(page).to have_content('Current User: ')
    end
  end
end