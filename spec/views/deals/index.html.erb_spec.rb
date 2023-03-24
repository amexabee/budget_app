require 'rails_helper'

RSpec.describe 'Deal index test', type: :feature do
  describe 'when user is signed in' do
    include Devise::Test::IntegrationHelpers

    before :each do
      @user = User.create(full_name: 'Amanuel', email: 'c@3', password: '123456')
      visit new_user_session_path
      sign_in @user
      find('input[type="submit"]').click
      @group = Group.create(name: 'Category 1', icon: 'icon', user: @user)
      visit group_deals_path(@group)
    end

    it 'should display the categories' do
      expect(page).to have_content('TRANSACTIONS')
    end

    it 'should display total' do
      expect(page).to have_content('Total')
    end

    it 'should display the total transaction' do
      expect(page).to have_content('$0')
    end

    it 'should display a new category button' do
      expect(page).to have_content('NEW TRANSACTION')
    end
  end
end
