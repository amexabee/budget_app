require 'rails_helper'

RSpec.describe 'Group new test', type: :feature do
  describe 'when user is signed in' do
    include Devise::Test::IntegrationHelpers

    before :each do 
      @user = User.create(full_name: 'Amanuel', email: 'c@2', password: '123456')
      visit new_user_session_path
      sign_in @user
      find('input[type="submit"]').click
      @group = Group.create(name: 'Category 1', icon: 'icon', user: @user)
      visit new_group_path
    end

    it 'should display the categories' do
      expect(page).to have_content('NEW CATEGORY')
    end

    it 'should display the name field' do
      expect(page).to have_css('input[placeholder="Name"]')
    end

    it 'should display the icon field' do
      expect(page).to have_css('input[placeholder="Icon"]')
    end 

    it 'should display a button to create category' do
      expect(page).to have_button('CREATE CATEGORY')
    end
  end
end
