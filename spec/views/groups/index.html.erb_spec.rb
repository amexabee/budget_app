require 'rails_helper'

RSpec.describe 'Group index test', type: :feature do
  describe 'when user is signed in' do
    include Devise::Test::IntegrationHelpers

    before :each do
      @user = User.create(full_name: 'Amanuel', email: 'c@1', password: '123456')
      visit new_user_session_path
      sign_in @user
      find('input[type="submit"]').click
      @group = Group.create(name: 'Category 1', user: @user)
      visit groups_path
    end

    it 'should display the categories' do
      expect(page).to have_content('CATEGORIES')
    end

    it 'should display the option to sign out' do
      expect(page).to have_content('Sign out')
    end

    it 'should display the category name' do
      expect(page).to have_content(@group.name)
    end

    it 'should display the total transaction' do
      expect(page).to have_content('Total transaction: $0')
    end

    it 'should display a new category button' do
      expect(page).to have_content('NEW CATEGORY')
    end
  end
end
