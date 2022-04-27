require 'rails_helper'

RSpec.describe 'Posts Controller', type: :request do
  describe 'Index Action' do
    before(:each) do
      get '/users/:user_id/posts'
    end

    it 'renders posts of a user index template' do
      expect(response).to render_template(:index)
    end

    it 'response status is correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'Show Action' do
    before(:each) do
      get '/users/:user_id/posts/:id'
    end

    it 'renders users show template' do
      expect(response).to render_template(:show)
    end

    it 'response status is correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Here is a post of a given user')
    end
  end
end
