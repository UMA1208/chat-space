class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
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
      redirect_to root_path(@group.id), alert: 'グループ作成に失敗しました'
    end
  end

  def edit
    @users = User.all
    set_group
  end

  def update
    if @group.update(group_params)
      redirect_to root_path(@groups.id), alert: 'グループを更新しました'
    else
      flash[:aleat] = 'グループ更新に失敗しました'
    end
  end

  private
  def group_params
    params.require(:group).permit(:group_name, user_ids:[])
  end

    def set_group
    @group = Group.find(params[:id])
  end

end
