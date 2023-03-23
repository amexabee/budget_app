class DealsController < ApplicationController
  before_action :authenticate_user!

  def index
    @deals = Deal.includes(:group_deals).where(group_deals: { group_id: params[:group_id] }).order(created_at: :desc)
  end
end
