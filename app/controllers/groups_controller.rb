class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
    @users = User.all
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path(@group.id), alert: 'グループが作成されました'
    else
      flash[:alert] = 'グループ作成に失敗しました'
      render :new
    end
  end

  def edit
  end

  private
  def group_params
    params.require(:group).permit(:group_name, {user_ids:[]})
  end
end
