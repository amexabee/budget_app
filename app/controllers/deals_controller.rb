class DealsController < ApplicationController
  before_action :authenticate_user!

  def index
    @deals = Deal.includes(:category).where(category_id: params[:category_id]).order(created_at: :DESC)
  end
end
