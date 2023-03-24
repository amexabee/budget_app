require 'rails_helper'

RSpec.describe 'Group new test', type: :feature do
  describe 'when user is signed in' do
    include Devise::Test::IntegrationHelpers

    before :each do
      @user = User.create(full_name: 'Amanuel', email: 'c@4', password: '123456')
      visit new_user_session_path
      sign_in @user
      find('input[type="submit"]').click
      @group = Group.create(name: 'Category 1', icon: 'icon', user: @user)
      visit new_group_deal_path(@group)
    end

    it 'should display the categories' do
      expect(page).to have_content('NEW TRANSACTION')
    end

    it 'should display the name field' do
      expect(page).to have_css('input[placeholder="Name"]')
    end

    it 'should display the icon field' do
      expect(page).to have_css('input[placeholder="Amount (number only)"]')
    end

    it 'should display a button to create category' do
      expect(page).to have_button('PROCESS TRANSACTION')
    end
  end
end
