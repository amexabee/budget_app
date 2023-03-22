class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path
    else
      render 'new', notice: 'not successful!'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon, :user_id)
  end
end
