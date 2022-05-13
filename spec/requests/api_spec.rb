require 'rails_helper'

describe 'API', type: :request do
  describe 'GET posts' do
    it 'test1' do
      get '/api/v1/users/1'
    end
  end
end
