require 'rails_helper'

RSpec.describe GroupDeal, type: :model do
  describe 'associations' do
    before do
      @user = User.create(full_name: 'Amanuel', email: 'a@5', password: '123456')
      @group = Group.create(name: 'Category 1', icon: 'icon', user: @user)
      @deal = Deal.create(name: 'Deal 1', amount: 12.5, author: @user)
      @group_deal = GroupDeal.create(group: @group, deal: @deal)
    end

    it 'belongs to a group' do
      expect(@group_deal.group).to eq(@group)
    end

    it 'belongs to a deal' do
      expect(@group_deal.deal).to eq(@deal)
    end
  end
end
