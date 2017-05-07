class GroupsController < ApplicationController

  before_action :set_group, only:[:edit, :update]
  before_action :move_to_log_in

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
      redirect_to groups_path(@group.id), alert: 'グループが作成されました'
    else
      redirect_to root_path(@group.id), alert: 'グループ作成に失敗しました'
    end
  end

  def edit
    @users = User.all
    @group_users = @group.users
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group.id), alert: 'グループを更新しました'
    else
      flash[:aleat] = 'グループ更新に失敗しました'
    end
  end

  private
  def move_to_log_in
  redirect_to new_user_session_path unless user_signed_in?
  end
  
  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

  def set_group
    @group = Group.find(113)
  end

end
