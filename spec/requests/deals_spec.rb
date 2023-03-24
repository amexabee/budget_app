require 'rails_helper'

RSpec.describe DealsController, type: :request do
  describe 'Goes to the corect route' do
    before do
      @user = User.create!(full_name: 'Amanuel', email: 'b@1', password: '123456')
      @group = Group.create!(name: 'Catagory 1', icon: 'icon', user: @user)
    end

    describe 'GET /deals' do
      it 'returns http success' do
        get "/groups/#{@group.id}/deals"
        follow_redirect!
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /new' do
      it 'returns http success' do
        get "/groups/#{@group.id}/deals/new"
        follow_redirect!
        expect(response).to have_http_status(:success)
      end
    end
  end
end
