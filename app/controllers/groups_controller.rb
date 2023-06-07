class GroupsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to groups_path
    else
      render 'new', notice: 'not successful!'
    end
  end

  def destroy
    GroupDeal.destroy_all
    Group.destroy_all
    redirect_to root_path, notice: 'All groups and their dependencies have been deleted.'
  end
  
  

  private

  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
