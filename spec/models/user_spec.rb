require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'requires full name to be present' do
      user = User.new(full_name: nil, email: 'a@1', password: '123456')
      expect(user).to_not be_valid
    end

    it 'requires email to be present' do
      user = User.new(full_name: 'Amanuel', email: nil, password: '123456')
      expect(user).to_not be_valid
    end

    it 'requires password to be present' do
      user = User.new(full_name: 'Amanuel', email: 'a@2', password: nil)
      expect(user).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has many categories' do
      @user = User.new(full_name: 'Amanuel', email: 'a@3', password: '123456')
      group = Group.create(name: 'Category 1', icon: 'icon', user: @user)
      expect(@user.groups).to include(group)
    end

    it 'has many deals' do
      @user = User.new(full_name: 'Amanuel', email: 'a@4', password: '123456')
      deal = Deal.create(name: 'Deal 1', amount: 12.5, author: @user)
      expect(@user.deals).to include(deal)
    end
  end
end
