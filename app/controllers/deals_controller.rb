class DealsController < ApplicationController
  before_action :authenticate_user!

  def index
    @deals = Deal.includes(:group).where(group_id: params[:group_id]).order(created_at: :DESC)
  end
end
