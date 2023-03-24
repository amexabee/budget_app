require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validations' do
    it 'requires name to be present' do
      group = Group.new(name: nil, icon: 'icon')
      expect(group).to_not be_valid
    end

    it 'requires icon to be present' do
      group = Group.new(name: 'Category 1', icon: nil)
      expect(group).to_not be_valid
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
      expect(@group.user).to eq(@user)
    end

    it 'has many group deals' do
      expect(@group.group_deals).to include(@group_deal)
    end
  end
end



  