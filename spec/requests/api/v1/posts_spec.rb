require 'swagger_helper'

RSpec.describe 'api/v1/posts', type: :request do
  path '/api/v1/users/{user_id}/posts' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'Authorization', in: :header, type: :string, required: true, description: 'Auth token'

    get('List all Posts') do
      response(200, 'successful') do
        tags 'Posts'
        let(:user_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/posts/{id}' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'
    parameter name: 'Authorization', in: :header, type: :string, required: true, description: 'Auth token'

    get('Show a Post') do
      response(200, 'successful') do
        tags 'Posts'
        let(:user_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
