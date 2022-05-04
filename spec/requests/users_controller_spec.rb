# require 'rails_helper'

# RSpec.describe 'Users Controller', type: :request do
#   describe 'Index Action' do
#     before(:each) do
#       get '/users/'
#     end

#     it 'renders users index template' do
#       expect(response).to render_template(:index)
#     end

#     it 'response status is correct' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'response body includes correct placeholder text' do
#       expect(response.body).to include('Here is a list of users')
#     end
#   end

#   describe 'Show Action' do
#     before(:each) do
#       get '/users/:id'
#     end

#     it 'renders users show template' do
#       expect(response).to render_template(:show)
#     end

#     it 'response status is correct' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'response body includes correct placeholder text' do
#       expect(response.body).to include('Here is a specific user')
#     end
#   end
# end
