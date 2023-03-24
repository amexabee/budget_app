require 'rails_helper'

RSpec.describe Deal, type: :model do
  describe 'validations' do
    it 'requires name to be present' do
      deal = Deal.new(name: nil, amount: 12.5)
      expect(deal).to_not be_valid
    end

    it 'requires amount to be present' do
      deal = Deal.new(name: 'Deal 1', amount: nil)
      expect(deal).to_not be_valid
    end

    it 'requires amount to be a number' do
      deal = Deal.new(name: 'Deal 1', amount: 'hi')
      expect(deal).to_not be_valid
    end

    it 'requires amount to be greater than 0' do
      deal = Deal.new(name: 'Deal 1', amount: 0)
      expect(deal).to_not be_valid
    end
  end

  describe 'associations' do
    before do
      @user = User.create(full_name: 'Amanuel', email: 'a@a', password: '123456')
      @group = Group.create(name: 'Category 1', icon: 'icon', user: @user)
      @deal = Deal.create(name: 'Deal 1', amount: 12.5, author: @user)
      @group_deal = GroupDeal.create(group: @group, deal: @deal)
    end

    it 'belongs to a user' do
      expect(@deal.author).to eq(@user)
    end

    it 'has many group deals' do
      expect(@deal.group_deals).to include(@group_deal)
    end
  end
end
