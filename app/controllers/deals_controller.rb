class DealsController < ApplicationController
  before_action :authenticate_user!

  def index
    @deals = Deal.includes(:group_deals).where(group_deals: { group_id: params[:group_id] }).order(created_at: :desc)
  end

  def new
    @deal = Deal.new
  end

  def create
    @group = Group.find(params[:group_id])

    if group_ids_present?
      @deal = Deal.new(deal_params.except(:group_ids))
      if @deal.save
        params[:deal][:group_ids].each do |group_id|
          @group_deal = GroupDeal.create(group_id: group_id, deal_id: @deal.id)
        end
        redirect_to group_deals_path
      else
        flash[:alert] = @deal.errors.full_messages.first if @deal.errors.any?
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to new_group_deal_path, alert: "Please select at least one group"
    end
  end

  private

  def deal_params
    params.require(:deal).permit(:name, :amount, :author_id)
  end

  def group_ids_present?
    params[:deal][:group_ids].reject(&:empty?).each do |item| 
      return true if Group.find_by(id: item)
    end
    false
  end
end
