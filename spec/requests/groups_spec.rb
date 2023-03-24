require 'rails_helper'

RSpec.describe GroupsController , type: :request do
  describe 'Goes to the corect route' do
    describe 'GET /groups' do
      it 'returns http success' do
        get '/groups'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /new' do
      it 'returns http success' do
        get '/groups/new'
        follow_redirect!
        expect(response).to have_http_status(:success)
      end
    end
  end
end
