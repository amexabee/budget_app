class DealsController < ApplicationController
  before_action :authenticate_user!

  def index
    @deals = Deal.includes(:group_deals).where(group_deals: { group_id: params[:group_id] }).order(created_at: :desc)
  end

  def new
    @deal = Deal.new
  end

  def create
    @deal = Deal.new(deal_params)
    @group = Group.find(params[:group_id])

    if @deal.save
      @group_deal = GroupDeal.create(group_id: @group.id, deal_id: @deal.id)
      redirect_to group_deals_path
    else
      flash[:alert] = @deal.errors.full_messages.first if @deal.errors.any?
      render :new, status: :unprocessable_entity
    end
  end

  private

  def deal_params
    params.require(:deal).permit(:name, :amount, :author_id)
  end
end
